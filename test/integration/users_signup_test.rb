require "test_helper"

class UsersSignupTest < ActionDispatch::
  test "Invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      before_count = User.count
      post users_path, user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"}
    end
    assert_template 'users/new'
  end
end
