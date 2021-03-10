Rails.application.routes.draw do
  root 'top#index'
  resources :books


  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"
  get "/users/edit", to: "users#edit", as: "edit_user"
  patch "/users", to: "users#update", as: "user"
  # ログイン・ログアウト
  get "/sign_in", to: "session#new"
  post "/sign_in", to: "session#create"
  get "/sign_out", to: "session#destroy"

end
