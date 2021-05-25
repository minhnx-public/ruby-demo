class Article < ApplicationRecord
  before_save {self.title = title.downcase}

  include Visible
  has_many :comments

  has_one_attached :image

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 10}
  validates :image, content_type: {in: %w[image/jpeg
image/gif image/png],
                                   message: "must be a valid image format",
                                   size: {less_than: 5.megabytes, message: "should be less than 5MB"}
  }

  def display_image
    image
  end
end
