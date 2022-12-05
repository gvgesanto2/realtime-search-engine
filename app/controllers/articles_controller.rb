class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      # @articles = Article.where("title LIKE ?", "%#{params[:query]}%")
      @articles = Article.search_by_title(params[:query])
    else
      @articles = Article.all
    end
  end
end