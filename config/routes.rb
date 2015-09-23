Rails.application.routes.draw do
  root to: "givers#new"
  resources :givers, only: [:new, :create, :show, :index]
  resources :donations, only: [:index]
  resources :access_accounts, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  get "/sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get "/thanks" => "givers#thanks", as: :thanks

  get "ui(/:action)", controller: "ui"

  namespace :admin do
    resources :gifts, only: [:index]
  end
end

Donor::Application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
