require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    asset_not @user.valid?
  end

  test "email should be present" do
    @user.name = " "
    assers_not @user.vaild?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
end
