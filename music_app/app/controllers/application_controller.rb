class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def login!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def current_user
    @current_user ||= User.find_by(session_token: sessions[:session_token])
  end
  
  def logged_in?
    !@current_user.nil?
  end
  
  def logout!
  end
  
  def require_logged_in
    logged_in?
  end
  
  def require_logged_out
    !logged_in?
  end
  
end
