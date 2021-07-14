Rails.application.routes.draw do
  resources :wines
  resources :countries
  resources :users
  root to: "sessions#home" #maybe delete not sure of this at the moment
  get "/signup", to: "users#new", as: "signup" #maybe delete not sure of this at the moment
  get "/login", to: "sessions#login", as: "login"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
