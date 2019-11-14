class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  #helper methods
  def current_user
    @user ||= User.find(session[:user_id]) if logged_in?
  end
  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless session.include? :user_id
       redirect_to root_path
    end
  end
end
