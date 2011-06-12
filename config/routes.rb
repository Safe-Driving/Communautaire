Communautaire::Application.routes.draw do

  get "content/auto"

  get "content/moto"

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
  match '/content/auto', :to => 'content#auto', :as => 'auto'
  match '/content/moto', :to => 'content#moto', :as => 'moto'
  match '/content/contact', :to => 'content#contact', :as => 'contact'
  match '/content/send_mail', :to => 'content#send_mail'

  root :to => 'articles#index'

end
