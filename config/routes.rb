Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  # Move these routes inside the `api` namespace if they are part of your API
  devise_for :users
   root to: 'users#index'
  
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  delete 'posts/:id', to: 'posts#destroy', as: :delete_post
  delete 'posts/:post_id/comments/:id', to: 'comments#destroy', as: :delete_comment
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
  
  post 'likes/:post_id', to: 'likes#create'
  post 'comments/:post_id', to: 'comments#create'

  namespace :api do
    namespace :v1 do
      # List all posts for a user

     resources :users, only: [:index, :show] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    
    end

      # Add a comment to a post
      # post '/posts/:post_id/comments', to: 'posts#create_comment'
  end 
 
  end

end 

