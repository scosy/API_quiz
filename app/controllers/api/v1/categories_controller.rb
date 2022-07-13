class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.create category_params

    if @category.valid?
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    render status: :no_content
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
