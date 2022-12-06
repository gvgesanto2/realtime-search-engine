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
     
    last_unconfirmed_search = Search.where(user_id:, confirmed: false).last

    if last_unconfirmed_search && params[:confirmed].present?
      last_unconfirmed_search.update(confirmed: true)
    end 
 
    if last_unconfirmed_search && similar_strings?(query, last_unconfirmed_search.query)
      last_unconfirmed_search.update(query:)
    else
      Search.create(query:, user_id:)
    end
  end
end