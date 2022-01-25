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

# Simulation of what we would do in browser
  test "valid signup information" do
      get signup_path
      assert_difference 'User.count', 1 do
        # Post to users path
        post users_path, params: { user: { name:  "Example User",
                                           email: "user@example.com",
                                           password:              "password",
                                           password_confirmation: "password" } }
      end
      # Won't work unless you follow redirect
      follow_redirect!
      assert_template 'users/show'
      asser is_login_in>
    end
  end
