class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # make those two methods available to the view templates
  helper_method :current_user, :logged_in?

  def current_user
  	# ||= make sure the following code only go to database once, it will not run ‘find' if @current_user has value
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	# turn current_user to bool value
  	!!current_user
  end

  def require_user
  	access_denied unless logged_in?
  end

  def require_admin
    access_denied unless logged_in? && current_user.admin?
  end

  def access_denied
    flash[:error] = "Access denied!"
    redirect_to root_path
  end
end
