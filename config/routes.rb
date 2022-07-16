Rails.application.routes.draw do
  # resources :comments
  # resources :posts
  # resources :likes
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  # get "/users/:user_id/posts/new" => "posts#new", as: :new
  # post "/users/:user_id/posts" => "posts#create", as: :create_post
  # get "/users" => "users#index", as: :users
  # get "/users/:id" => "users#show", as: :user
  # get "/users/:user_id/posts" => "posts#index", as: :user_posts
  # get "/users/:user_id/posts/:id" => "posts#show", as: :user_post
  resources :users do
    resources :posts
    resources :comments
  end
end
