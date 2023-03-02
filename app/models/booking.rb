class Booking < ApplicationRecord
  has_many :showings, dependent: :destroy
  has_many :seats, dependent: :destroy
  has_many :movies, through: :showings

  def remaining_seats(shw_id, cin_id)
    total_seats = Seat.where(cinema_id: cin_id).count
    total_bookings = Booking.where(showing_id: shw_id).count
    return total_seats - total_bookings
  end

end