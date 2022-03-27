Rails.application.routes.draw do
  root "events#index"
  
  devise_for :users
  get "user/show", to: "users#show"

  resources :events
end
