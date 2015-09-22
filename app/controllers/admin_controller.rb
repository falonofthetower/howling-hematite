class AdminController < ApplicationController
  before_action :require_admin
  helper_method :current_admin, :logged_in?
  layout "admin"

  def access_denied
    flash[:danger] = "You don't have the access to do that!"
    redirect_to root_path
  end

  def require_admin
    access_denied unless logged_in?
  end
end
