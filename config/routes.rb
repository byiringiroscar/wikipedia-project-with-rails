Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "users#index"
  
  devise_for :users, controllers: { sessions: 'devise/sessions' }
  
  devise_scope :user do
    root "devise/sessions#new"
  end
  
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'create_user_post_comment'
  post '/users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'create_user_post_like'
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
end
