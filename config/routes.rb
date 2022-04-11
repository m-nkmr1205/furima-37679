Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
  root to: "items#index"

  resources :items, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create, :new]
  end
end
