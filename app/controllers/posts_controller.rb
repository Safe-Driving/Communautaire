class PostsController < ApplicationController
  def new
  end

def index
    @posts = Post.order('created_at DESC').last(3)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

end
