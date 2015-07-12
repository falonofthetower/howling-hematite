class AccessAccountsController < ApplicationController
  def new
  end

  def create
    giver = Giver.find_by(email: params[:email])
    if giver
      giver.tokenize
      AppMailer.send_account_token(giver).deliver
      redirect_to access_account_path giver.id
    else
      redirect_to new_access_account_path
      flash[:danger] = "There is no donation with that email"
    end
  end

  def show
    @giver = Giver.find(params[:id])
  end
end
