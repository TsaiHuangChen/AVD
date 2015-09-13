desc "generate the data for analysis"
task :data_generate => :environment do
  DataGenerateWorker.new.perform
end


