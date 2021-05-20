require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @article = Article.new(title: "test 1", body: "content 1")
  end

  test "title should be unique" do
    duplicate_article = @article.dup
    @article.save
    assert_not duplicate_article.valid?
  end
end
