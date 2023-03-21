Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end

  namespace :api do
    resources :users, only: %i[index] do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
