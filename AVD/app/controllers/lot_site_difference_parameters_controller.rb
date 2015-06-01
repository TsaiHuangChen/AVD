class LotSiteDifferenceParametersController < ApplicationController

  def edit
    @lot = Lot.find(params[:id])
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
    params.require(:lot).permit(
        :site_0_enable,
        :site_1_enable,
        :site_2_enable,
        :site_3_enable,
        :site_4_enable,
        :site_5_enable,
        :site_6_enable,
        :site_7_enable,
        :site_0_yield,
        :site_1_yield,
        :site_2_yield,
        :site_3_yield,
        :site_4_yield,
        :site_5_yield,
        :site_6_yield,
        :site_7_yield
    )
  end
end
