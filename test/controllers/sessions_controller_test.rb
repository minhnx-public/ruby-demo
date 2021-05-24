require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should get welcome" do
    get welcome_url
    assert_response :success
  end
end
