class CategoriesController < ApplicationController
  def new
    @category =  Category.new
  end

  def create
  @category = Category.new(params[:category])

 # @category = Category.find(params[:category][:id])
 # @article.category = @category
 #  @article.author = current_user.id


  if current_user.administrator?
    @category.save
     redirect_to  categories_path
  else

  end
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
