module BookingsHelper

  def check_if_booking_exists?(user_id, show_id)
    Booking.exists?(user_id: user_id, showing_id: show_id)
  end
  
  def check_if_booking_seats_is_occupied?(seat_id, showing_id)
    Booking.exists?(seat_id: seat_id, showing_id: showing_id)
  end

  def seats_query(show_cinema_id)
    Seat.where(cinema_id: show_cinema_id)
  end

  def remaining_seats(show_cinema_id, show_id)
    Seat.where(cinema_id: show_cinema_id).count - Booking.where(showing_id: show_id).count
  end
  
end