class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :logged_in?
         
private
         
  def logged_in?
    if session[:user_id] == @user.id
      @user
    else
      nil
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
       
end
