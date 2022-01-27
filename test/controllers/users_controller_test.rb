require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user       = users(:eliza)
    @other_user = users(:fury)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    # get new_user_url
    get signup_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "should redirect edit when not logged in" do
    get: edit, id: @user.id
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name,, email: @user.email
    asser flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name,, email: @user.email }
    assert flash.empty?
    assert_redirected_to login_url
  end
end
