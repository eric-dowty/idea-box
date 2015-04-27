class Admin::UsersController < Admin::BaseController

  before_filter :current_admin?

  def show
    @user = User.find_by(username: params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(username: params[:id])
  end 

  def update
    user = User.find_by(username: user_params[:username])

    if user.update(role: user_params[:role])
      flash[:notice] = "#{params[:user][:username]} is now a #{params[:user][:role]} user."
      redirect_to admin_user_path(user)
    else
      flash[:errors] = user.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @user = User.find_by(username: params["id"]).destroy
    flash[:notice] = "User has been deleted"
    redirect_to admin_users_path
  end

  private

  def user_params 
    params.require(:user).permit(:username, :role, :id)
  end

end