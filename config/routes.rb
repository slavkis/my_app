Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#home"

  resources :users, only: [:edit, :show, :update, :destroy] do 
    resources :habbits, only: [:create, :index, :show]
  end
  delete "users/:id/habbits/:id", to: "habbits#destroy"
end
