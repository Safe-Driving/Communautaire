=begin
  Controller pour la gestion des posts

  @author : Florian Petit
=end
class PostsController < ApplicationController

  def index
    @posts = Post.order('created_at DESC').last(3)
  end

end