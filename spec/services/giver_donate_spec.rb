require 'spec_helper'
describe GiverDonate, :vcr do
  describe "#donate" do
    context "valid giver info and valid card" do
      let(:philanthropist) do
        double(
          :philanthropist,
          success?: true,
          payment_method_nonce: "nonce",
          amount: "10.00",
          id: 35
        )
      end

      before do
        BraintreeWrapper::Transaction.should_receive(:sale).and_return(philanthropist)
        GiverDonate.new(Fabricate.build(:giver, first_name: "Dark", last_name: "Warrior")).donate("10", "payment_method_nonce")
      end

      it "creates giver" do
        expect(Giver.count).to eq(1)
      end

      it "creates a related donation" do
        expect(Giver.first.donations.first.amount.to_i).to eq(10)
      end

      it "sends out email with givers name" do
        expect(
          ActionMailer::Base.deliveries.last.body
        ).to include("Dark Warrior")
      end
    end

    context "testing mailchimp" do
      let(:philanthropist) do
        double(
          :philanthropist,
          success?: true,
          payment_method_nonce: "nonce",
          amount: "10.00",
          id: 35
        )
      end

      it "delegates mail chimp subscribe to mailchimp" do
        luke = Fabricate(:giver)
        mailchimp_subscription = double("mailchimp_subscription")
        MailchimpSubscription.stub(:delay).and_return(mailchimp_subscription)
        mailchimp_subscription.should_receive(:subscribe)
        BraintreeWrapper::Transaction.should_receive(:sale).and_return(philanthropist)
        GiverDonate.new(luke).donate("10", "payment_method_nonce")
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
            first_name: "no password"
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
