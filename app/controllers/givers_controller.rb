class GiversController < ApplicationController
  def new
    gon.client_token = generate_client_token
    @giver = Giver.new
  end

  def create
    @giver = Giver.new(giver_params)
    if @giver.valid?
      result = BraintreeWrapper::Transaction.sale(
        amount: params[:giver][:amount],
        payment_method_nonce: params[:payment_method_nonce],
      )
      if result.success?
        @giver.save
        session[:giver_id] = @giver.id
        flash[:success] = "Thank you for your support!"
        redirect_to giver_path(@giver.id)
      else
        flash.now[:danger] = result.message
        gon.client_token = generate_client_token
        render :new
      end
    else
      flash.now[:danger] = "Please correct the errors!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  def giver_params
    params.require(:giver).permit(:full_name, :message, :email, :amount)
  end

  def show
    @giver = Giver.find(params[:id])
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end
end
