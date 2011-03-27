=begin
  Controller pour la gestion des articles

  @author : Romain Delhoute
=end
class ArticlesController < ApplicationController

  def index
    @articles = Article.limit(3)
  end

end
