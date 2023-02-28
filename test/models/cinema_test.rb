require "test_helper"

class CinemaTest < ActiveSupport::TestCase
  def setup
    @user = users(:danray)
    @cinema = @user.cinemas.build(name: "iMax")
  end

  test "should be valid" do
    assert @cinema.valid?
  end

  test "name should be present" do
    @cinema.name = ""
    assert_not @cinema.valid?
  end

  test "should not be more than 30 characters" do 
    @cinema.name = "a" * 31
    assert_not @cinema.valid?
  end

  test "name should be unique" do
    duplicate_cinema = @cinema.dup
    duplicate_cinema.name = @cinema.name
    @cinema.save
    assert_not duplicate_cinema.valid?
  end
end
