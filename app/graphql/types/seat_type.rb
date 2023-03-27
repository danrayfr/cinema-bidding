# frozen_string_literal: true

module Types
  class SeatType < Types::BaseObject
    field :id, ID, null: false
    field :cinema_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :seat_name, String
  end
end
