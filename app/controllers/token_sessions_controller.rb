class TokenSessionsController < ApplicationController
  def create
    giver = Giver.find_by(token: params[:token])
    if giver
      giver.detokenize
      session[:giver_id] = giver.id
      flash[:success] = "Welcome back, #{giver.full_name}"
      redirect_to giver_path(giver.id)
    else
      session[:giver_id] = nil
      flash[:danger] = "That link is expired or invalid"
      redirect_to new_access_account_path
    end
  end
end
