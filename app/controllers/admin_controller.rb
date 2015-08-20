class AdminController < ApplicationController
  before_action :require_admin
  helper_method :current_admin, :logged_in?

  def current_admin
    @current_admin ||=  Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in?
    !!current_admin
  end

  def access_denied
    flash[:danger] = "You don't have the access to do that!"
    redirect_to sign_in_path
  end

  def require_admin
    access_denied unless logged_in?
  end
end
