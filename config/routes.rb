Rails.application.routes.draw do
  root to: "top#index"
  resources :top , only: :index
  resources :users , only: [:new]
end
