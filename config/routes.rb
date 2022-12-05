Rails.application.routes.draw do
  devise_for :users
 
  resources :articles, only: [:index]

  # Defines the root path route ("/")
  root "articles#index"
end
