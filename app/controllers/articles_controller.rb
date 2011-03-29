=begin

  Controller pour la gestion des articles

  @author : Romain Delhoute
  
=end

class ArticlesController < ApplicationController

  def index
    @articles = Article.order('created_at DESC').limit(3)
  end
  
  def show
    @article = Article.find(params[:id])
  end

end