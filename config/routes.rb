Communautaire::Application.routes.draw do

  resources :articles
  resources :topics

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'topics#index'
  root :to => 'pages#home'



end
