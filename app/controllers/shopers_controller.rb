class ShopersController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @shoper = Shoper.new
    if @shoper.update(shoper_params)
      redirect_to shop_path(@shop), notice: "Success!"
    else
      redirect_to shop_path(@shop), alert: "Invalid!"
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @shoper = @shop.shopers.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @shoper = @shop.shopers.find(params[:id])
    if @shoper.update(shoper_params)
      redirect_to shop_path(@shop), notice: "success!"
    else
      flash[:alert] = "Invalid"
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @shoper = @shop.shopers.find(params[:id])
    @shoper.destroy
    redirect_to shop_path(@shop), notice: "Deleted!"
  end

  private
  def shoper_params
    params.require(:shoper).permit(:content, :name, :shop_id)
  end

  end
