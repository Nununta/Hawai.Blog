class GoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :edit, :update, :destroy]
  def index
    @goods = current_user.goods.order(created_at: :desc)
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    @good.user_id = current_user.id
    if @good.save
      redirect_to goods_path, notice: 'Sucess!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def show
    @answer = Answer.new
  end

  def edit

  end

  def update
    if @good.update(good_params)
      redirect_to goods_path, notice: "Success!"
    else
      flash[:alert] = "Save error!"
      render :edit
    end
  end

  def destroy
    @good.destroy
    redirect_to goods_path, notice: "Success!"
  end

  private
  def set_good
    @good = Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:name, :quantity, :price)
  end

  def validate_user
    if @good.user != current_user
      redirect_to goods_path, alert: "自分の投稿ではありません"
    end
  end

end
