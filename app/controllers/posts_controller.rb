class PostsController < ApplicationController
  def new
     @post =  Post.new
     @topic = Topic.find(params[:topic_id])

   end

  def create
    @post = Post.new(params[:post])
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    @post.author = current_user.id
    @category = Category.find(@topic.category.id)
    @post.save
    redirect_to  category_topic_path(@category.id,@topic.id)
  end

  def index
  @posts = Post.order('created_at DESC').last(3)

end

  def show
  end

  def update
       @topic = Topic.find(params[:topic_id])
       @post = Post.find(params[:id])
       @content = params[:post][:content]

       @post.content = @content
       @category = Category.find(@topic.category.id)

       if @post.save
         redirect_to  category_topic_path(@category.id,@topic.id)
        flash[:notice] = 'Post was successfully updated.'
       else
         flash[:error] = 'Post was not updated.'
         redirect_to :edit
       end
  end

  def edit
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
  end


end
