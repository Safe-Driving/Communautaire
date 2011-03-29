Communautaire::Application.routes.draw do

  resources :articles
  resources :topics

  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'topics#index'
  root :to => 'pages#home'

<<<<<<< HEAD


=======
>>>>>>> b09a877b0e0b412328028e2d0a9d9a7623b91193
end
