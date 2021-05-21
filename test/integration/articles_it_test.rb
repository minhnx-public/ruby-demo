require "test_helper"

# IGNORE AUTHENTICATION BEFORE TESTING IN APPLICATION_CONTROLLER
class ArticlesItTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @article = articles(:two)
    @user = users(:one)
  end

  test "unsuccessful edit" do
    log_in_as(@user)

    puts @article.inspect
    get edit_article_path(@article)
    assert_template 'articles/edit'
    patch article_path(@article), params: {article: {title: "", body: ""}}
    assert_template 'articles/edit'
  end

  test "successful edit" do
    log_in_as(@user)

    get edit_article_path(@article)
    assert_template 'articles/edit'
    title = "foo"
    body = "bar sdf sdf sdf"
    status = "public"
    patch article_path(@article), params: {article: {title: title, body: body, status: status}}
    # assert_not flash.empty?
    assert_redirected_to @article
    @article.reload
    assert_equal title, @article.title
    assert_equal body, @article.body
  end
end
