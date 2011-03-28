=begin
  Controller pour la gestion des articles

  @author : Romain Delhoute
=end
class ArticlesController < ApplicationController

  def index
    @articles = Article.order('created_at DESC').last(3)
  end

end