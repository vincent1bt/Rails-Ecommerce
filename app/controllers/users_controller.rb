class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = @current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:notice] = "Welcome"
      redirect_to @user
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
