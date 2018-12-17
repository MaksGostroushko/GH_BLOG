Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  root 'static_pages#home'

  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  patch 'toggle_banned/:id', to: 'users#toggle_banned', as: 'toggle_banned'

  resources :users

  resources :microposts do
    resources :comments do
      resources :likes
    end
    resources :likes
  end

  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :microposts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:create, :destroy]
  end

  resources :pictures, only: [:create, :destroy]
  resources :tags, only: [:show]
  resources :categories
end
