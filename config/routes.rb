Rails.application.routes.draw do
  namespace :admin do
    get "bookings", to: "bookings#index"
    get "dashboard", to: "dashboard#index"
    resources :cinemas
    resources :movies
    resources :showings
  end

  get "dashboard", to: "dashboard#index"
  root "bookings#index"
  resources :bookings, only: %i(index show create)
  devise_for :users
end
