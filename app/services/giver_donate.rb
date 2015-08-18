class GiverDonate
  attr_reader :error_message, :giver

  def initialize(giver)
    @giver = giver
  end

  def donate(amount, payment_method_nonce)
    if @giver.valid?
      philanthropist = BraintreeWrapper::Transaction.sale(
        amount: amount,
        payment_method_nonce: payment_method_nonce,
        giver: @giver
      )
      if philanthropist.success?
        @giver.save
        Donation.create(amount: amount, giver: @giver, transaction_id: philanthropist.id)
        @status = :success
      else
        @status = :failure
        @error_message = philanthropist.message
      end
    else
      @status = :failure
      @error_message = "Please correct the errors!"
    end
    self
  end

  def success?
    @status == :success
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end
end
