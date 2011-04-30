Communautaire::Application.routes.draw do

  devise_for :users

  resources :users
  resources :articles
  scope "forum" do
    resources :categories do
      resources :topics
    end
    scope "categories" do
      resources :topics do
        resources :posts
      end
      #scope "topics" do
      #  resources :posts
      #end
    end
  end





  match '/home',    :to => 'pages#home'
  match '/forum', :to => 'categories#index'
  match '/categories', :to => 'categories#index'
  match '/posts', :to => 'posts#index'

  root :to => 'pages#home'
  get "pages/home"

end
