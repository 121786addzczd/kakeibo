Rails.application.routes.draw do
  get 'books/index'
  root 'top#index'
  resources :books

end
