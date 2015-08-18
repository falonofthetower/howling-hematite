class AdminController < ApplicationController
  before_action :require_giver
  before_action :require_admin

  private

  def require_admin
    unless current_giver.admin?
      flash[:danger] = "You don't have authorization to do that"
      redirect_to home_path
    end
  end
end
