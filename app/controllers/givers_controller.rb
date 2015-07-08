class GiversController < ApplicationController
  def new
    @giver = Giver.new
  end

  def create
    @giver = Giver.new(giver_params)
    if @giver.save
      flash[:success] = "Thank you for your support!"
      redirect_to root_path
    else
      render :new
      flash.now[:danger] = "Please correct the errors!"
    end
  end

  def giver_params
    params.require(:giver).permit(:full_name, :message)
  end
end
