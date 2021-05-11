Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :reservations
  resources :payments
  
  root "home#index"

  #Route for User features
  #reservation routes
  post "/make_reservation", to: "home#make_reservation"
  post "/reserved", to: "home#reserved"
  delete "/remove_reservation", to: "home#remove_reservation"
  
  #payment routes
  get "/process_payment", to: "home#process_payment"
  post "/payment_completed", to: "home#payment_completed"
  get "/remove_payment", to: "home#remove_payment"

  #user dashboard info
  get "/user_books", to: "home#user_books"
  get "/user_payments", to: "home#user_payments"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
