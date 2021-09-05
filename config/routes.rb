Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "users#index"
  resources :users , only: [:new]

  resources :top , only: :index
  resources :stickman_war , only: [:index , :show] do
    # resources :stickman_war_detail , only: [:show]do
    #   resources :stickman_war_comments , only: [:create , :update , :destroy]
    # end
  end
  resources :requests , only: [:new , :create , :show]
end
