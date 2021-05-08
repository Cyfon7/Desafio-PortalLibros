Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :reservations
  
  delete "/remove_reservation", to: "home#remove_reservation"
  get "/user_books", to: "home#user_books"
  post "/reserved", to: "home#reserved"
  post "/make_reservation", to: "home#make_reservation"
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
