class StaticPagesController < ApplicationController

  skip_before_action :authorized, only: [:home, :help]

  def home
  end

  def help
  end
end
