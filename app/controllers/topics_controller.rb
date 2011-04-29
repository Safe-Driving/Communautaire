class TopicsController < ApplicationController
  def new
    @topic =  Topic.new
  end

def create
 @topic = Topic.new(params[:topic])

  @category = Category.find(params[:category][:id])
  @topic.category = @category
  @topic.author = current_user.id

  raise @topic.save.inspect
  redirect_to  topics_path
  end


  def index
    @topics = Topic.order('created_at DESC').last(3)
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts

  end

  def edit
  end

end
