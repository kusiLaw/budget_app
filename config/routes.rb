Rails.application.routes.draw do
  
  root "homes#splash"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :categories
  # Defines the root path route ("/")
  # root "articles#index"
end
