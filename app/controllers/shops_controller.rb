class ShopsController < ApplicationController
before_action :authenticate_user!
before_action :set_shop, only: [:show, :edit, :update, :destroy]
before_action :validate_user, only: [:show, :edit, :update, :destroy]

def index
  @shops = current_user.shops.order(created_at: :desc)
end

def new
  @shop = Shop.new
end

def create
  @shop = Shop.new(shop_params)
  @shop.user_id = current_user.id
  if @shop.save
    redirect_to shops_path, notice: 'Sucess!'
  else
    flash[:alert] = 'Save error!'
    render :new
  end
end

def show
  @shoper = Shoper.new
end

def edit

end

def update
  if @shop.update(shop_params)
    redirect_to shops_path, notice: "Success!"
  else
    flash[:alert] = "Save error!"
    render :edit
  end
end

def destroy
  @shop.destroy
  redirect_to shops_path, notice: "Success!"
end

private
def set_shop
  @shop = Shop.find(params[:id])
end

def shop_params
  params.require(:shop).permit(:shopname, :content, :place, :date)
end

def validate_user
  if @shop.user != current_user
    redirect_to shops_path, alert: "自分の投稿ではありません"
  end
end

end
