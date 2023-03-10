Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items
  resources :users do
    resources :items, only: [:new, :show, :create, :edit, :update, :destroy]
  end
  
  resources :items do
    resources :orders, only: [:index, :new, :show, :create]
  end
end
