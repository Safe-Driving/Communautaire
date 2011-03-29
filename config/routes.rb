Communautaire::Application.routes.draw do

  get "sessions/new"

  get "users/new"

  get "users/create"

  resources :users
  resources :articles
  resources :topics
  resources :sessions, :only => [:new, :create, :destroy]

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'topics#index'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => 'pages#home'
  get "pages/home"


end
