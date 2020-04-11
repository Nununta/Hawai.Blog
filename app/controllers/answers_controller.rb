class AnswersController < ApplicationController

  def create
    @good = Good.find(params[:good_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to good_path(@good), notice: "Success!"
    else
      redirect_to good_path(@good), alert: "Invalid!"
    end

  end

  def edit
    @good = Good.find(params[:good_id])
    @answer = @good.answers.find(params[:id])
  end

  def update
    @good = Good.find(params[:good_id])
    @answer = @good.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to good_path(@good), notice: "success!"
    else
      flash[:alert] = "Invalid"
      render :edit
    end
  end

  def destroy
    @good = Good.find(params[:good_id])
    @answer = @good.answers.find(params[:id])
    @answer.destroy
    redirect_to good_path(@good), notice: "Deleted!"
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :name, :good_id)
  end

end
