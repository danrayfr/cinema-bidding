require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user =  User.new(first_name: "user", last_name: "sample", mobile: "09560635541", email: "user@sample.com", password: "password", password_confirmation: "password")
  end

  test "first name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

  test "new user should be user by default" do
    assert_not @user.admin?
  end

  test "mobile number should not be longer than 11 digits" do
    @user.mobile = "a" * 13 && @user.mobile = "a" * 10
    assert_not @user.valid?
  end
end
