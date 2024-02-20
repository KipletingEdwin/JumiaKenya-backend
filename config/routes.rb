Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end

  post'/login', to: 'auth#create'
  
end
