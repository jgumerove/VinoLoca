Rails.application.routes.draw do
  resources :countries do
    resources :wines, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  end

  resources :users
  
  root to: "sessions#home" 
  get "/signup", to: "users#new", as: "signup" 
  get "/wines/new", to: "wines#add"
  post "/wines", to: "wines#addition"
  get "/login", to: "sessions#login", as: "login"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"
  get "/auth/google_oauth2/callback", to: "sessions#google_omniauth"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
