class TopicsController < ApplicationController
  def new
  end

  def index
    @topics = Topic.order('created_at DESC').last(3)

  end

  def show
    @topic = Topic.find(params[:id])

  end

  def edit
  end

end
