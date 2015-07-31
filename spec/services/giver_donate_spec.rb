require 'spec_helper'

describe GiverDonate do
  describe "#donate" do
    context "valid giver info and valid card" do
      let(:philanthropist) do
        double(
          :philanthropist,
          success?: true,
          payment_method_nonce: "nonce",
          amount: "10.00"
        )
      end

      before do
        BraintreeWrapper::Transaction.should_receive(:sale).and_return(philanthropist)
      end

      it "creates giver" do
        GiverDonate.new(Fabricate.build(:giver)).donate("payment_method_nonce", "10")
        expect(Giver.count).to eq(1)
      end
    end

    context "with valid input and invalid card" do
      let(:philanthropist) do
        double(
          :philanthropist,
          success?: false,
          error_message: "Your card was declined"
        )
      end
    end

    context "with invalid input" do
      before do
        GiverDonate.new(
          Giver.new(
            email: "email@example.com",
            full_name: "no password"
          )).donate("nonce", "10")
      end

      it "does not create the user" do
        expect(Giver.count).to eq(0)
      end

      it "does not charge the card" do
        BraintreeWrapper::Transaction.should_not_receive(:sale)
      end
    end
  end
end
