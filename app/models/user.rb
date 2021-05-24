class User < ApplicationRecord

  attr_accessor :remember_token

  before_save :downcase_username
  validates :username, presence: true, length: {maximum: 30}

  has_many :microposts, dependent: :destroy

  has_secure_password

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def create_reset_digest

  end

  def send_password_reset_email

  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
                 BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  private

  def downcase_username
    self.username = username.downcase
  end
end
