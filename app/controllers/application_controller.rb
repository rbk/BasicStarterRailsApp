class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 def authenticate
    if session[:user_id].nil? 
      redirect_to login_path, notice: 'Please login.'
    end
  end

  def authenticate_admin
    if session[:user_id].nil? || session[:group] != 'admin'
      redirect_to login_path, notice: 'Access Denied.'
    end
  end

  private

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_user
    @user ||= User.find(session[:user_id]) if session[:user_id] && session[:group] == 'admin'
  end
  
  helper_method :current_user, :admin_user

end
