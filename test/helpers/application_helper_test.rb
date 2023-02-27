require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do 
    assert_equal full_title, "Online Bidding"
    assert_equal full_title("Home"), "Home | Online Bidding"
  end
end