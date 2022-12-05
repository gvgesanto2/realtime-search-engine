class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search_by_title(params[:query])
    else
      @articles = Article.all
    end

    @articles = @articles.paginate(per_page: 10, page: params[:page])
  end
end