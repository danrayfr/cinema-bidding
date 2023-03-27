module Types
  class MutationType < Types::BaseObject
    field :create_movie, mutation: Mutations::CreateMovie
    field :create_user, mutation: Mutations::CreateUser
    field :create_cinema, mutation: Mutations::CreateCinema
  end
end
