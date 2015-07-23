class GiverDonate
  attr_reader :error_message
  def initialize(giver)
    @giver = giver
  end

  def donate(amount, payment_method_nonce)
    if @giver.valid?
      result = Braintree::Transaction.sale(
        :amount => amount,
        :payment_method_nonce => payment_method_nonce,
        :options => {
          :submit_for_settlement => true
        }
      )
      if result.success?
        @giver.save
        session[:giver_id] = @giver.id
        @status = :success
      else
        @status = :failure
        @error_message = result.error
      end
    else
      @status = :failure
      @error_message = "Please fix the errors"
    end
  end

  def successful?
    @status == :success
  end
end
