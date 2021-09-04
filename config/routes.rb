Rails.application.routes.draw do
  get 'stickman_war_detail/show'
  get 'stickman_war_stage/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "users#index"
  resources :users , only: [:new]

  resources :top , only: :index
end
