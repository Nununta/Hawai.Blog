class FoodanswersController < ApplicationController
  before_action :set_foodanswer, only: [:edit, :update, :destroy]
  def create
    @food = Food.find(params[:food_id])
    @foodanswer = Foodanswer.new
    if @foodanswer.update(foodanswer_params)
      redirect_to food_path(@food), notice: "Success!"
    else
      redirect_to food_path(@food), alert: "Invaled!"
    end
  end

  def edit
  end

  def update
    if @foodanswer.update(foodanswer_params)
      redirect_to food_path(@food), notice: "Success!"
    else
      flash[:alert] = "Invaled"
      render :edit
    end

    def destroy
      @foodanswer.destroy
      redirect_to food_path(@food), notice: "Deleted!"
    end

  end

  private
  def set_foodanswer
    @food = Food.find(params[:food_id])
    @foodanswer = @food.foodanswers.find(params[:id])
  end

  def foodanswer_params
      params.require(:foodanswer).permit(:content, :name, :food_id)
  end
end
