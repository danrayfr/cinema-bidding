require "test_helper"

class MovieTest < ActiveSupport::TestCase
  def setup 
    @user = users(:danray)
    @movie = @user.movies.build(title: "Spiderman")
  end

  test "should be valid" do
    assert @movie.valid?
  end
 
  test "title should be present" do
    @movie.title = ""
    assert_not @movie.valid?
  end
 
  test "title should not be longer than 30 characters" do
    @movie.title = "a" * 31
    assert_not @movie.valid?
  end
 
  test "title should be unique" do
    duplicate_movie = @movie.dup
    duplicate_movie.title = @movie.title
    @movie.save
    assert_not duplicate_movie.valid?
  end
 
end
