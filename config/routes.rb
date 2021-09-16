Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "top#index"
  resources :users , only: [:new , :index , :show , :update , :edit] do
    resources :followers , only: [:create , :destroy]
  end

  resources :top , only: :index
  resources :stickman_war , only: [:index , :show] do
    resources :stickman_war_detail , only: [:show]do
      resources :stickman_war_comments , only: [:create , :update , :destroy]
    end
  end
  resources :requests , only: [:new , :create , :show]
  resources :movies , only: [:index , :show] do
    resources :movie_comments , only: [:create , :update , :destroy]
  end
  resources :groups do
    resources :messages , only: [:create , :update , :destroy , :edit]
    resources :group_user_relations , only: [:create , :destroy]
  end

  post '/groups/:group_id/group_user_relations/:user_id/:id' , to: "group_user_relations#update"
end
