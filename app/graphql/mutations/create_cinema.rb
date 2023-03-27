module Mutations
  class CreateCinema < BaseMutation
    argument :name, String, required: true
    
    field :seat, Types::SeatType, null: false

    type Types::CinemaType
    
    
    def resolve(name:)
      cinema = Cinema.new(
        name: name,
        user_id: current_user.id
      )

      if cinema.save
        cinema.seat_count.times do |n|
          cinema.seats.create!(seat_name: "Seat: #{n+1}")
        end
      end
    end

  end
end