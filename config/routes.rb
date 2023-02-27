Rails.application.routes.draw do
  namespace :admin do
    resources :cinemas
    resources :movies
  end


  root "pages#home"
  devise_for :users
end
