Rails.application.routes.draw do
  root "events#index"
  
  post "users", to: "users#create"

  devise_for :users

  get "user/show", to: "users#show"

  resources :events, only: [:index, :show, :new, :create]
  
  post "attended_event/:id", to: "attended_events#create", as: "attended_event"
end
