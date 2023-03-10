Rails.application.routes.draw do
  
  
  root "homes#splash"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :expenses
    resources :categories
  end
  resources :categories
  resources :expenses
  # Defines the root path route ("/")
  # root "articles#index"
end
