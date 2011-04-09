Communautaire::Application.routes.draw do

  devise_for :users

  resources :users
  resources :articles
  resources :topics
  resources :categories
  resources :posts

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'categories#index'
  match '/categories', :to => 'categories#index'
  match '/posts', :to => 'posts#index'

  root :to => 'pages#home'
  get "pages/home"


end
