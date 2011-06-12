class CategoriesController < AuthorizationController
  load_and_authorize_resource

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

  def update
   @category = Category.find(params[:id])
   @name = params[:category][:name]
   @category.name = @name


   if @category.save
    redirect_to  categories_path
    flash[:notice] = 'Article was successfully updated.'
   else
     flash[:error] = 'Article was not updated.'
     redirect_to :edit
   end
  end

  def edit

    @category = Category.find(params[:id])

  end

end
