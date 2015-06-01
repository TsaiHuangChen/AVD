class LotsController < ApplicationController
  before_action :set_lot, :only => [ :show, :edit_normal_mode, :update, :destroy ]

  def index
    @lots = Lot.page(params[:page]).per(10)
  end

  def new
    @lot = Lot.new
    @page_title = "new lot"
  end

  def create
    @lot = Lot.new(lot_params)
    if @lot.save

      #create the rows in site table
      for i in 0..(@lot.site_number-1) do
        Site.create( :site_lot => @lot.name, :site_serial => i )
      end

      if(@lot.generate_mode == 1)
        redirect_to :controller => :lot_normal_parameters, :action => :edit, :id => @lot
      elsif(@lot.generate_mode == 2)
        redirect_to :controller => :lot_cliff_parameters, :action => :edit, :id => @lot
      else
        redirect_to :controller => :lot_site_difference_parameters, :action => :edit, :id => @lot
      end
    else
      render :action => :new
    end
  end

  def show
    #@lot = Lot.find(params[:id])
    @page_title = @lot.name
  end

  def destroy
    #@lot = Lot.find(params[:id])
    @lot.destroy
    flash[:alert] = "lot were succesfully deleted"

    redirect_to :action => :index
  end

  private

  def lot_params
    params.require(:lot).permit(
      :name,
      :tester,
      :device,
      :total_device_count,
      :site_number,
      :generate_mode
    )
  end

  def set_lot
    @lot = Lot.find(params[:id])
  end

end
