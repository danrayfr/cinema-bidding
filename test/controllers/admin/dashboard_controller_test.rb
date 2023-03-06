require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:danray)
    get admin_dashboard_url
    assert_response :success
  end
end
