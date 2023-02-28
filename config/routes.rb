Rails.application.routes.draw do
  namespace :admin do
    resources :cinemas
    resources :movies
    resources :showings
  end

  root "pages#home"
  devise_for :users
end
