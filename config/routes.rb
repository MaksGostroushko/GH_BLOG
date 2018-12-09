Rails.application.routes.draw do
  root 'static_pages#home'

  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  patch 'toggle_banned/:id', to: 'users#toggle_banned', as: 'toggle_banned'
  get 'show_two/:id', to:'users#show_two'

  resources :users

  resources :microposts do
    resources :likes
  end

  # resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:create, :destroy]
  end
  resources :pictures, only: [:create, :destroy]
end
