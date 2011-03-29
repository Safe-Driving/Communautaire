Communautaire::Application.routes.draw do


  resources :users
  resources :articles
  resources :topics

  match '/signup',  :to => 'users#new'
  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'topics#index'

  root :to => 'pages#home'

  get "users/new"


end
