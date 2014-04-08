class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl

  private 
  def logged_in?
    unless session[:user_id]
      flash[:notice] = "You must be logged in" 
      redirect_to :controller=>"sessions", :action=>"new"
      return false
    else
      return true
    end
  end
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
