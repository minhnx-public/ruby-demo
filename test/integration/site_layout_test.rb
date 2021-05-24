require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'sessions/welcome'
    assert_select "form[action=?]", login_path
    assert_select "form[action=?]", sign_up_path
    # assert_select "form[action=?]", logout_path, count: 1
  end
end
