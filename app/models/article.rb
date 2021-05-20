class Article < ApplicationRecord
  before_save {self.title = title.downcase}

  include Visible
  has_many :comments

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 10}
end
