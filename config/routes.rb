Rails.application.routes.draw do
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  # Defines the root path route ("/")
  root 'users#index'
end
