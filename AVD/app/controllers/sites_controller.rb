class SitesController < ApplicationController
  def edit
    @lot = Lot.find(params[:id])
    @sites = Site.where( lot_id: @lot.id ).to_a
    @page_title = "edit " + @lot.name
  end

  def update
    @lot = Lot.find(params[:id])
    @sites = Site.where( lot_id: @lot.id ).to_a
    if @lot.update(lot_site_difference_params)
      redirect_to :controller => :lots, :action => :index
      flash[:notice] = "lot #{@lot.name} were succesfully created"
    else
      render :action => :edit
    end
  end

  def edit_multiple
    @lot = Lot.find(params[:id])
    #create the rows in site table
    for i in 0..(@lot.site_number-1) do
      @lot.sites.build( :site_serial => i )
    end

  end

  def update_multiple
    @lot = Lot.find(params[:id])
    @lot.attributes = params[:lot]
    @lot.sites.update(params[:site].keys, params[:site].values)
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
