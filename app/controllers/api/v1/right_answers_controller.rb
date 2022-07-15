class Api::V1::RightAnswersController < ApplicationController
  def index
    @right_answers = RightAnswer.all
    render json: @right_answers
  end

  def show
    @right_answer = RightAnswer.find(params[:id])
    render json: @right_answer
  end

  def create
    @right_answer = RightAnswer.create right_answer_params

    if @right_answer.valid?
      render json: @right_answer, status: :created
    else
      render json: @right_answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @right_answer = RightAnswer.find(params[:id])
    @right_answer.destroy
    render status: :no_content
  end

  private

  def right_answer_params
    params.require(:right_answer).permit(:answer)
  end
end
