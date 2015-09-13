desc "analyze the data"
task :data_analyze => :environment do
  DataAnalyzeWorker.new.perform
end

