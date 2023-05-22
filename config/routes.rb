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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
