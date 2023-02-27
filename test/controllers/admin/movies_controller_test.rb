require "test_helper"

class Admin::MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:danray)
  end

  test "should get new" do
    sign_in @user
    get new_admin_movie_url
    assert_response :success
  end 
end
