require "test_helper"
require "json"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
    @user = users(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get microposts_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_micropost_url
    assert_response :success
  end

  test "should create micropost" do
    log_in_as(@user)
    assert_difference('Micropost.count') do
      post microposts_url, params: {micropost: {content: @micropost.content, user_id: @micropost.user_id}}
      puts "inserted new microposts"
    end

    puts Micropost.last.to_json
    assert_redirected_to micropost_url(Micropost.first)
  end

  test "should show micropost" do
    log_in_as(@user)
    get micropost_url(@micropost)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_micropost_url(@micropost)
    assert_response :success
  end

  test "should update micropost" do
    log_in_as(@user)
    patch micropost_url(@micropost), params: {micropost: {content: @micropost.content, user_id: @micropost.user_id}}
    assert_redirected_to micropost_url(@micropost)
  end

  test "should destroy micropost" do
    log_in_as(@user)
    assert_difference('Micropost.count', -1) do
      delete micropost_url(@micropost)
    end

    assert_redirected_to microposts_url
  end
end
