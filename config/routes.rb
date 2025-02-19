Rails.application.routes.draw do
  
  devise_for :users
  root "homes#top"
  
  
  get "home/about" => "homes#about", as: 'about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end
