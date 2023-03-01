require "test_helper"

class BookingTest < ActiveSupport::TestCase
  def setup
    @user = users(:danray)
    @showing = showings(:one)
    @seat = seats(:one)
    @booking = @user.bookings.build(showing_id: @showing.id, seat_id: @seat.id)
  end

  test "should be valid" do 
    assert @booking.valid?
  end

  test "show and seat should have the same cinema id" do 
    assert @showing.cinema.id == @seat.cinema.id
  end

end
