require "test_helper"

class Admin::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:danray)
    get admin_bookings_url
    assert_response :success
  end
end
