require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "Should get contact" do
    get : contact
    assert_response :success
    assert_select title, ABOUT | Ruby on Rails Tutorial Sample A"
  end

end
