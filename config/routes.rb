Rails.application.routes.draw do
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # get 'password_resets/new'
  # get 'password_resets/edit'
  root 'static_pages#home'

  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  patch 'toggle_banned/:id', to: 'users#toggle_banned', as: 'toggle_banned'
  # post 'repost/:id', to: 'micropost#repost', as: 'repost'

  resources :users

  resources :microposts do
    resources :likes
    resources :comments
  end

  # resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:create, :destroy]
  end
  resources :pictures, only: [:create, :destroy]

  resources :tags, only: [:show]
  resources :categories
end
