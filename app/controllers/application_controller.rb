class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    redirect_to root_path unless current_user && current_user.admin?
  end

  def user_owns_idea?(idea)
    idea.owned_by?(current_user.id)
  end

  # def not_found
  #   raise ActionController::RoutingError.new('Not Found')
  # end

end
