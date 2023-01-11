Rails.application.routes.draw do
  resources :expenses
  
  root "homes#splash"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
   resources :expenses
  end
  resources :categories
  # Defines the root path route ("/")
  # root "articles#index"
end
