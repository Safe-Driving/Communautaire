Communautaire::Application.routes.draw do

  get "pages/home"
  get "articles/index"

  root :to => 'pages#home'

end
