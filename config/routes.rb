Rails.application.routes.draw do
  devise_for :users
  get "homes/about"
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show]
end
