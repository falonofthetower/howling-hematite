class SessionsController < ApplicationController
  layout "admin"

  def new
    redirect_to admin_gifts_path if logged_in?
  end

  def create
    admin = Admin.find_by(username: params[:username])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_gifts_path
    else
      flash[:error] = "You are not Chuck Norris--Chuck Norris doesn't need this page to login"
      redirect_to sign_in_path
    end
  end
end
