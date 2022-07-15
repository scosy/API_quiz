module Api
  module V1
    class RightAnswersController < ApplicationController
      def index
        @right_answers = RightAnswer.all
        render json: @right_answers
      end

      def show
        @right_answer = RightAnswer.find(params[:id])
        render json: @right_answer
      end
    end
  end
end
