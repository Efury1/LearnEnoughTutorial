require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    get root-help_path
    assert_template 'static_pages/home'
  end
end
