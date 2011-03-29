Communautaire::Application.routes.draw do

  get "users/new"

  get "users/create"

  resources :users
  resources :articles
  resources :topics

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'topics#index'
  match '/signup',  :to => 'users#new'

  root :to => 'pages#home'
  get "pages/home"
  get "users/new"


end
