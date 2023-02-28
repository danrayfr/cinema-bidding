require "test_helper"

class ShowingTest < ActiveSupport::TestCase
  def setup
    @cinema = cinemas(:cinemax)
    @movie = movies(:spiderman)
    @showing = Showing.new(date: Time.now + 1, time: Time.now, movie_id: @movie.id, cinema_id: @cinema.id)
  end

  test "date should be present" do
    @showing.date = ""
    assert_not @showing.valid?
  end

  test "date should be greater than date today" do 
    show = @showing.date + 1
    assert_gt show, Date.today
  end

  test "time should be present" do
    @showing.time = ""
    assert_not @showing.valid?
  end

end
