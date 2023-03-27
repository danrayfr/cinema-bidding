Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
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
