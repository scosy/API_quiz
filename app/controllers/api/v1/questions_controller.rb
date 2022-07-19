class Api::V1::QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    @question = Question.find(params[:id])
    render json: @question
  end

  def create
    @question = Question.create question_params

    if @question.valid?
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render status: :no_content
  end

  private

  def question_params
    params.require(:question).permit(%i[question difficulty right_answer_id category_id])
  end
end
