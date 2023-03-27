module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_movies, [Types::MovieType], String, null: false
    def all_movies
      Movie.all
    end

    field :all_users, [Types::UserType], String, null: false
    def all_users
      User.all
    end

    field :all_cinemas, [Types::CinemaType], String, null: false
    def all_cinemas
      Cinema.all
    end

    # Get a specific user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :seat, [Types::SeatType], String, null: false do
      argument :id, ID, required: true
    end

    def seat(id:)
      Seat.where(cinema_id: id)
    end

  end
end