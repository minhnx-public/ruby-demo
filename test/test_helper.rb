ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user)
    puts "=====> login helper 1"
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  def log_in_as(user, password: 'password')
    puts "=====> login helper 2: " + user.username + ", " + password
    post login_path, params: {username: user.username, password: password}
  end
end