Rails.application.routes.draw do
  root to: "givers#new"
  resources :givers, only: [:new, :create, :show]
  resources :access_accounts, only: [:new, :create, :show]
  get '/token_sessions/:token' => 'token_sessions#create', as: :token_sessions
end

Donor::Application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
