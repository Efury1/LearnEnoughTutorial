require "test_helper"

def setup
  @user = users(:eliza)
end

class UsersEditTest < ActionDispatch::IntegrationTest
  test "unsucessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {name: "",
                                    email: "user@invalid",
                                    password: "foo"
                                    password_confirmation: "bar"}
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    patch user_path(@user), user: {name: "",
                                   email: "user@invalid",
                                   password: " "
                                   password_confirmation: " "}
    assert_to flash.empty?
    assest_redirect_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
 end
