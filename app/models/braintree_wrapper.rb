class BraintreeWrapper
  class Transaction
    attr_reader :result, :message

    def initialize(options = {})
      @result = options[:result]
      @message = options[:message]
    end

    def self.sale(options = {})
      result = Braintree::Transaction.sale(
        amount: options[:amount],
        payment_method_nonce: options[:payment_method_nonce],
        options: {
          submit_for_settlement: true
        }
      )
      new(result: result)
    rescue Braintree::ValidationsFailed => e
      new(message: e.message)
    end

    def success?
      result.success?
    end

    def id
      result.transaction.id
    end

    def message
      messages = []
      result.errors.each { |error| messages << error.message }
      "There was a problem processing your card #{messages.join(" ")}"
    end
  end
end
