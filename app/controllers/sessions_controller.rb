class SessionsController < ApplicationController

  before_filter :current_user

  def new
  end

  def create
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid login."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logout successful"
    redirect_to login_path
  end

  private

  def user_params 
    params.require(:session).permit(:username, :password)
  end

end