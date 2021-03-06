class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create

    puts "authenticating user: " + params[:username] + ", " + params[:password]

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:error] = "username or password is incorrect"
      redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end

  def page_requires_login

  end

  def logout
    if (logged_in?)
      session.delete(:user_id)
      @current_user = nil
    end
    redirect_to root_url
  end
end
