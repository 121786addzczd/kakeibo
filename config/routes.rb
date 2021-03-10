Rails.application.routes.draw do
  root 'top#index'
  resources :books

  # ユーザー新規登録
  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"
  # ログイン・ログアウト
  get "/sign_in", to: "session#new"
  post "/sign_in", to: "session#create"
  get "/sign_out", to: "session#destroy"

end
