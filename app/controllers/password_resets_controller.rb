class PasswordResetsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :edit]

  def new

  end

  def create
    @user = User.find_by(username: params[:password_reset][:username].downcase)

    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "email sent with password reset instructions"

      redirect_to root_url
    else
      flash.now[:danger] = "email address not found"

      render "new"
    end
  end

  def edit

  end
end
