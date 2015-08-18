class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_giver, :logged_in?

  def current_giver
    @current_giver ||=  Giver.find(session[:giver_id]) if session[:giver_id]
  end
  
  def logged_in?
    !!current_giver
  end

  def access_denied
    flash[:danger] = "You don't have the access to do that!"
    redirect_to sign_in_path
  end

  def require_giver
    access_denied unless logged_in?
  end
end
