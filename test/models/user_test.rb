require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(username: "demo1", password: "123")
  end

  test "associated micropost should be destroyed" do
    @user.save
    @user.microposts.create!(content: "demo1")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end
end
