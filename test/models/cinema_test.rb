require "test_helper"

class CinemaTest < ActiveSupport::TestCase
  def setup
    @user = users(:danray)
    @cinema = @user.cinemas.build(name: "Cinemax")
  end

  test "should be valid" do
    assert @cinema.valid?
  end

  test "name should be present" do
    @cinema.name = ""
    assert_not @cinema.valid?
  end

  test "seats should be 10 by default" do
    assert @cinema.seats == 10
  end

  test "should not be more than 30 characters" do 
    @cinema.name = "a" * 31
    assert_not @cinema.valid?
  end
end
