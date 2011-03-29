class CategoriesController < ApplicationController
  def new
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @topics = @category.topics
  end

  def edit
  end

end
