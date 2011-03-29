Communautaire::Application.routes.draw do

<<<<<<< HEAD



  get "posts/new"

  get "posts/index"

  get "posts/show"

  get "posts/edit"
=======
  get "sessions/new"

  get "users/new"
>>>>>>> 4643a885308a235758b9e18ca82fc5d4b7bc1ee7

  get "users/create"

  resources :users
  resources :articles
  resources :topics
<<<<<<< HEAD
  resources :categories
  resources :posts
=======
  resources :sessions, :only => [:new, :create, :destroy]
>>>>>>> 4643a885308a235758b9e18ca82fc5d4b7bc1ee7

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'categories#index'
  match '/categories', :to => 'categories#index'
  match '/posts', :to => 'posts#index'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  root :to => 'pages#home'
  get "pages/home"


end
