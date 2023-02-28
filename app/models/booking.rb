class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :showing
  belongs_to :seat
end

# Seat.where(cinema_id: Showing.cinema.id)

# seats.each do |seat|
#   seat
#   if seat.cinema_id == showing.cinema.id 
#     @remaining_seats = showing.cinema.seat_count - seats.length
#   end
# end