require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'articles/index'
    assert_select "a[href=?]", home_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", home_path, count: 1
  end
end
