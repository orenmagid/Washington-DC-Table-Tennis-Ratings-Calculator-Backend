Rails.application.routes.draw do
  resources :ratings
  resources :player_matches
  resources :matches
  resources :sessions
  resources :player_groups
  resources :groups
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
