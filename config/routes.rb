Rails.application.routes.draw do
  resources :keywords
  resources :post_types
  resources :commentars
  resources :commetars
  resources :posts
  devise_for :users
  resources :posts do
    resources :commentars, only: [:create]
  end





  root 'home#index'
  get '/search', to: 'home#search', as: 'search'
  get '/search_type', to: 'home#search_posts_type', as: 'search_posts_type'
  get '/search_by_author', to: 'home#search_posts_author', as: 'search_posts_author'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
