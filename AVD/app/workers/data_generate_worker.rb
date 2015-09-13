class DataGenerateWorker
  include Sidekiq::Worker
  def perform()
    while true
      #time1 = Time.now
      #puts "Start generating at #{time1}"

      Lot.find_each do |lot|
        #find the last tested device serial
        if(lot.data.last.nil?)
          $last_test_serial = 0
        else
          $last_test_serial = lot.data.last.serial
        end

        #if the last tested device serial < total device count => generate
        if($last_test_serial < lot.total_device_count)
          for site in lot.sites do
            if(site.site_enable == true)
              #handle the current testing serial
              $last_test_serial += 1

              #handle the current tested bin
              if(lot.generate_mode == 1)    #normal mode
                current_bin = bin_decision(lot.basic_yield)
              elsif(lot.generate_mode == 2)   #cliff mode
                if($last_test_serial <= lot.cliff_number)
                  current_bin =  bin_decision(lot.first_region_yield)
                else
                  current_bin =  bin_decision(lot.second_region_yield)
                end
              else
                current_bin = current_bin =  bin_decision(site.site_yield)
              end

              #write in the data table
              d_in = Datum.new(:serial => $last_test_serial, :lot => lot, :bin => current_bin, :site => site.site_serial)
              d_in.save
            end
          end
        else
          #if the last tested device serial >= total device count => break, kill the lot?
        end

      end
      #time2 = Time.now
      #puts "End 128 lots generating at #{time2}"

    end
  end

  private

  def bin_decision(threshold)
    tmp = rand(100)
    if(tmp <= threshold)
      bin = 1
    else
      bin = 2
      #bin = rand(2..10)
    end
    return bin
  end
end
