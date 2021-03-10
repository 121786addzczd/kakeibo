Rails.application.routes.draw do
  root 'top#index'
  resources :books

  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"

end
