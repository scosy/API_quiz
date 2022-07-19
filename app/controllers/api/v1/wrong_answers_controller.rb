class Api::V1::WrongAnswersController < ApplicationController
  def index
    @wrong_answers = WrongAnswer.all
    render json: @wrong_answers
  end

  def show
    @wrong_answer = WrongAnswer.find(params[:id])
    render json: @wrong_answer
  end

  def create
    @wrong_answer = WrongAnswer.create wrong_answer_params

    if @wrong_answer.valid?
      render json: @wrong_answer, status: :created
    else
      render json: @wrong_answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wrong_answer = WrongAnswer.find(params[:id])
    @wrong_answer.destroy
    render status: :no_content
  end

  private

  def wrong_answer_params
    params.require(:wrong_answer).permit(%i[answer question_id])
  end
end
