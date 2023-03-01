Rails.application.routes.draw do
  namespace :admin do
    resources :cinemas
    resources :movies
    resources :showings
  end

  root "bookings#index"
  resources :bookings
  devise_for :users
end
