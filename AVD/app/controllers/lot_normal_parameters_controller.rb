class LotNormalParametersController < ApplicationController
  def edit
    @lot = Lot.find(params[:id])
    @page_title = "edit " + @lot.name
  end

  def update
    @lot = Lot.find(params[:id])
    if @lot.update(lot_normal_params)
      redirect_to :controller => :lots, :action => :index
      flash[:notice] = "lot #{@lot.name} were succesfully created"
    else
      render :action => :edit
    end
  end

  private

  def lot_normal_params
    params.require(:lot).permit(
        :basic_yield,
    )
  end

end
