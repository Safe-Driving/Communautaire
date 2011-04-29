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
   if @article.save
     flash[:notice] = 'Article was successfully created.'
    redirect_to :root
   else
     flash[:error] = 'Article was not created.'
     redirect_to :new
  end
  end

  def index
    @articles = Article.order('created_at DESC').limit(3)
    if !current_user.nil?
    if current_user.administrator?
      @addarticle = "New Article"
    end
    end
  end
  
  def show
    @article = Article.find(params[:id])
     if !current_user.nil?
    if current_user.administrator?
      @editarticle = "Edit"
    end
     end
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
   flash[:notice] = 'Article was successfully updated.'
  else
    flash[:error] = 'Article was not updated.'
    redirect_to :edit
  end
  end

  def edit
  
  @article = Article.find(params[:id])

  end

end