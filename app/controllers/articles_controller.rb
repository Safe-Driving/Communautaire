=begin

  Controller pour la gestion des articles

  @author : Romain Delhoute
  
=end

class ArticlesController < ApplicationController

  def new
  @article = Article.new
  @title = "Ajout d'un article"

  end

  def create
  @article = Article.new(params[:article])


  @category = Category.find(params[:category][:id])
  @article.category = @category
  @article.author = current_user.id
  @article.save
  end
  
  def index
    @articles = Article.order('created_at DESC').limit(3)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def update
  @article = Article.find(params[:id])
  @category = Category.find(params[:category][:id])
  @article.category = @category
  @article.author = current_user.id
  @content = params[:article][:content]
  @article.content = @content
  @title =   params[:article][:title]
  @article.title =  @title
  if @article.save
    redirect_to :root
  else
    redirect_to :articles
  end
  end

  def edit
  
  @article = Article.find(params[:id])
  end

end