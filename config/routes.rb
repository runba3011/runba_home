Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "top#index"
  resources :users , only: [:new , :index , :show]

  resources :top , only: :index
  resources :stickman_war , only: [:index , :show] do
    # resources :stickman_war_detail , only: [:show]do
    #   resources :stickman_war_comments , only: [:create , :update , :destroy]
    # end
  end
  resources :requests , only: [:new , :create , :show]
  resources :movies , only: [:index , :show] do
    resources :movie_comments , only: [:create , :update , :destroy]
  end
  resources :groups do
    resources :messages , only: [:create]
  end
end
