class TopicsController < ApplicationController
  def new
    @topic =  Topic.new
    @category = Category.find(params[:category_id])
  end

def create
  @topic = Topic.new(params[:topic])

  @category = Category.find(params[:category_id])
  @topic.category = @category
  @topic.author = current_user.id

  @topic.save
  redirect_to  category_topic_path(@category.id,@topic.id)
  end


  def index
    @topics = Topic.order('created_at DESC').last(3)
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @category = Category.find(params[:category_id])
  end

  def update
     @category = Category.find(params[:category_id])
     @topic = Topic.find(params[:id])
     @title = params[:topic][:title]
     @content = params[:topic][:content]
     @description = params[:topic][:description]

     @topic.title = @title
     @topic.content = @content
     @topic.description = @description


     if @topic.save
       redirect_to  category_topic_path(@category.id,@topic.id)
      flash[:notice] = 'Topic was successfully updated.'
     else
       flash[:error] = 'Topic was not updated.'
       redirect_to :edit
     end
    end

    def edit
      @category = Category.find(params[:category_id])
      @topic = Topic.find(params[:id])
    end


end
