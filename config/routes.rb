Rails.application.routes.draw do
  root to: "givers#new"
  resources :givers, only: [:new, :create]
end
