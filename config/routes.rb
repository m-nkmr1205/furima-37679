Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
  root to: "items#index"

  resources :items, only: [:new, :index, :create] 
  
end
