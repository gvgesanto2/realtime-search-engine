class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_searches = Search.where(user: current_user).group(:query).order(count: :desc).count
  end
end
