require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
      log_in_as(users(:michael))
      micropost = microposts(:ants)
      assert_no_difference 'Micropost.count' do
        delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end

  test "should get index" do
    get microposts_url
    assert_response :success
  end

  test "should get new" do
    get new_micropost_url
    assert_response :success
  end

  test "should create micropost" do
    assert_difference('Micropost.count') do
      post microposts_url, params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
    end

    assert_redirected_to micropost_url(Micropost.last)
  end

  test "should show micropost" do
    get micropost_url(@micropost)
    assert_response :success
  end

  test "should get edit" do
    get edit_micropost_url(@micropost)
    assert_response :success
  end

  test "should update micropost" do
    patch micropost_url(@micropost), params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
    assert_redirected_to micropost_url(@micropost)
  end

  test "should destroy micropost" do
    assert_difference('Micropost.count', -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end
