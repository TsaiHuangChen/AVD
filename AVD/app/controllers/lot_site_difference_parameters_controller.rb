class LotSiteDifferenceParametersController < ApplicationController

  def edit
    @lot = Lot.find(params[:id])
    @sites = Site.where( lot_id: @lot.id ).to_a
    @page_title = "edit " + @lot.name
  end

  def update
    @lot = Lot.find(params[:id])
    if @lot.update(lot_site_difference_params)
      redirect_to :controller => :lots, :action => :index
      flash[:notice] = "lot #{@lot.name} were succesfully created"
    else
      render :action => :edit
    end
  end

  private

  def lot_site_difference_params
    params.require(:site).permit(
        :lot_id,
        :site_serial,
        :site_enable,
        :site_yield
    )
  end
end
