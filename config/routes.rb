Communautaire::Application.routes.draw do




  get "posts/new"

  get "posts/index"

  get "posts/show"

  get "posts/edit"

  get "users/create"

  resources :users
  resources :articles
  resources :topics
  resources :categories
  resources :posts

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'categories#index'
  match '/categories', :to => 'categories#index'
  match '/posts', :to => 'posts#index'
  match '/signup',  :to => 'users#new'

  root :to => 'pages#home'
  get "pages/home"
  get "users/new"


end
