=begin

  Controller pour la gestion des articles

  @author : Romain Delhoute
  
=end

class ArticlesController < ApplicationController

  def new
  @article = Article.new
  @title = "Ajout d'un article"
  end
  
  def index
    @articles = Article.order('created_at DESC').limit(3)
  end
  
  def show
    @article = Article.find(params[:id])
	
  end
  
  def edit
  
  @article = Article.find(params[:id])
  end

end