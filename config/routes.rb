Rails.application.routes.draw do
  get "home", to: "givers#new"
  resources :givers, only: [:new, :create]
end
