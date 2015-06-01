class DataController < ApplicationController

  def index
    @lots = Lot.page(params[:page]).per(10)
  end

end
