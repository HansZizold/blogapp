Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create]
    end
  end

  # Defines the root path route ("/")
  # root 'users#index'
  root to: 'users#index'
end
