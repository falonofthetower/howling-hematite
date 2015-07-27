require 'spec_helper'

describe BraintreeWrapper, :vcr do
  describe BraintreeWrapper::Transaction do
    describe ".sale" do
      it "makes a successful sale" do
        result = BraintreeWrapper::Transaction.sale(
          amount: "344.55",
          payment_method_nonce: "fake-valid-nonce"
        )
        expect(result.success?).to be_truthy
      end

      it "delivers errors on unsuccessful sale" do
        result = BraintreeWrapper::Transaction.sale(
          amount: "2344.55",
          payment_method_nonce: "fake-valid-nonce"
        )
        expect(result.success?).to be_falsy
      end
    end
  end
end
