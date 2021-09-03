Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :top , only: :index
  resources :users , only: [:new]
end
