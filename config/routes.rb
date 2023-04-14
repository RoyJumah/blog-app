Rails.application.routes.draw do
  # get 'home/header'
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
end
