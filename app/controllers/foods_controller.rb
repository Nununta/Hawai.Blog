class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :edit, :update, :destroy]

  def index
    @foods = current_user.foods.order(created_at: :desc)
  end

  def show
    @foodanswer = Foodanswer.new
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path, notice: "Success"
    else
      flash[:alert] = "Save error!"
      render :new
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to foods_path, notice: "Success"
    else
      flash[:alert] = "Save error!"
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path, notice: "Success!"
  end

  private
  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:date, :name, :food, :price, :quantity, :place)
  end

  def validate_user
    if @food.user != current_user
      redirect_to foods_path, alert: "自分の投稿ではありません"
    end
  end

end
