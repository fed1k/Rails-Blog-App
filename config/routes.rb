Rails.application.routes.draw do
  devise_for :users
  devise_for :members
  # resources :comments
  # resources :posts
  # resources :likes
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  post '/login', to: 'auth#login', default: {:format => :json}
  # get "/users/:user_id/posts/new" => "posts#new", as: :new
  # post "/users/:user_id/posts" => "posts#create", as: :create_post
  # get "/users" => "users#index", as: :users
  # get "/users/:id" => "users#show", as: :user
  # get "/users/:user_id/posts" => "posts#index", as: :user_posts
  # get "/users/:user_id/posts/:id" => "posts#show", as: :user_post
  resources :users do
    resources :posts do
      resources :comments
    end
  end

  scope 'api' do
    get '/posts/:id/comments' => 'api/comments#index', as: :api_post_comments
    post '/posts/:id/comments' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end
end
