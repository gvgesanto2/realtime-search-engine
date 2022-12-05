class ArticlesController < ApplicationController
  include StringHelper
  before_action :authenticate_user!

  def index
    query = params[:query]

    if query.present?
      @articles = Article.search_by_title(query)

      create_search(query, current_user.id)
    else
      @articles = Article.all
    end

    @articles = @articles.paginate(per_page: 10, page: params[:page])
  end

  private 

  def create_search(query, user_id)
    return unless query.present? && query.length >= 3
    # return unless params[:stopped].present? || params[:commit].present? 
    
    recent_user_search = Search.where(user_id:, confirmed: false).last

    if recent_user_search && params[:confirmed].present?
      recent_user_search.update(confirmed: true)
    end 
 
    if recent_user_search && similar_strings?(query, recent_user_search.query)
      recent_user_search.update(query:)
    else
      Search.create(query:, user_id:)
    end
  end
end