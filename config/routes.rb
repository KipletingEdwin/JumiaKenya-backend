Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  resources :people, only: [:index, :show, :create, :destroy, :update]  # Define routes for people

  # Route for listing all users
  resources :users, only: [:index, :create]
end
