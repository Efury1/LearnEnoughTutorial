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

  test "email should not be too long" do
    @users.email = "a" * 256
    assert_not @user.valid?, "Address #{valid_address.inspect} should be valid"
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.CO A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each |invalid_addresses|
      @user.email = invalid_addresses
      assert_not @user.valid?, "#{invalid_addresses.inspect} should be invalid"
    end
  end

  test "email address should be unquie" do
    duplicate_user = @user.duplicate_user
    duplicate_user = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
