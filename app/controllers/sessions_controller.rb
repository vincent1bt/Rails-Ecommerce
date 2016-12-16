class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      flash[:notice] = "Bienvenido"
      redirect_to user
    else
      flash[:alert] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
