class GiversController < ApplicationController
  def new
    @giver = Giver.new
  end

  def create
    @giver = Giver.new(giver_params)
    if @giver.save
      session[:giver_id] = @giver.id
      flash[:success] = "Thank you for your support!"
      redirect_to giver_path(@giver.id)
    else
      flash.now[:danger] = "Please correct the errors!"
      render :new
    end
  end

  def giver_params
    params.require(:giver).permit(:full_name, :message, :email)
  end

  def show
    @giver = Giver.find(params[:id])
  end
end
