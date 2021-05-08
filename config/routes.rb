Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :reservations
  resources :payments
  
  delete "/remove_reservation", to: "home#remove_reservation"
  get "/user_books", to: "home#user_books"
  get "/user_payments", to: "home#user_payments"
  post "/reserved", to: "home#reserved"
  post "/make_reservation", to: "home#make_reservation"
  get "/process_payment", to: "home#process_payment"
  get "/remove_payment", to: "home#remove_payment"

  root "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
