Communautaire::Application.routes.draw do

  match '/home',    :to => 'pages#home'
  
  resources :articles

  root :to => 'pages#home'

  match 'posts/index', :to => 'posts#index'

end
