class RootController < ApplicationController
  def home
    DataAnalyzeWorker.perform_async()

  end
end
