Communautaire::Application.routes.draw do

  match '/home',    :to => 'pages#home'
  match '/articles',    :to => 'articles#index'

  root :to => 'pages#home'

end
