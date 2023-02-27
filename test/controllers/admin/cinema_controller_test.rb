require "test_helper"

class Admin::CinemaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:danray)
    get admin_cinemas_url
    assert_response :success
  end

  test "should redirect to login" do
    get admin_cinemas_url
    assert_redirected_to new_user_session_url
  end

  test "redirect to root path when not admin" do
    sign_in users(:genie)
    get admin_cinemas_url
    assert_redirected_to root_url
  end
end
