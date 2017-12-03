Rails.application.routes.draw do
  root to: "givers#new"
  resources :givers, only: [:new, :create, :show, :index]
  resources :donations, only: [:index]
  resources :access_accounts, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :crash_locations, only: [:index]

  get "/sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get "/thanks" => "givers#thanks", as: :thanks

  get "ui(/:action)", controller: "ui"

  get "/petition" => redirect("http://www.thepetitionsite.com/417/742/234/save-lives-not-dollars-urge-dot-to-adopt-vision-zero-policy/"), as: :petition
  namespace :admin do
    resources :gifts, only: [:index]
    resources :crash_locations
  end
end

Donor::Application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
