Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ratings
      resources :player_matches
      resources :matches
      resources :sessions
      resources :player_groups
      resources :recurring_sessions
      resources :players
      resources :signup_forms
      resources :player_intents
      post "/player_intents/create_or_update", to: "player_intents#create_or_update"
      post "/login", to: "auth#create"
      get "ping", to: "ping#index"
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
