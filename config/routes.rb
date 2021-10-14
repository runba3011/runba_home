Rails.application.routes.draw do
  resources :request_emails
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "top#index"
  resources :users , only: [:new , :index , :show , :update , :edit] do
    resources :followers , only: [:create , :destroy]
    resources :all_user_requests , only: [:index , :show , :create , :destroy , :new] do
      collection do
        get 'search'
        get 'user_search'
      end
    end
  end

  put '/users/:user_id/all_user_requests/:request_id/:controll_id' , to: "all_user_requests#update"

  resources :top , only: [:index , :show]
  resources :stickman_war , only: [:index , :show] do
    resources :stickman_war_detail , only: [:show]do
      resources :stickman_war_comments , only: [:create , :update , :destroy]
    end
  end
  resources :stickman_war_characters , only: [:index]
  get '/stickman_war_characters/:class_id/:character_id' , to: "stickman_war_characters#show"

  resources :requests , only: [:new , :create , :show]
  resources :movies , only: [:index , :show] do
    resources :movie_comments , only: [:create , :update , :destroy]
    collection do
      get 'search'
    end
  end
  resources :groups do
    resources :messages , only: [:create , :update , :destroy , :edit]
    resources :group_user_relations , only: [:create , :destroy]
  end

  resources :skill_room , only: [:index]
  get "/skill_room/:type_id/:id" , to: "skill_room#show"

  post '/groups/:group_id/group_user_relations/:user_id/:id' , to: "group_user_relations#update"
  
end
