require "spec_helper"

describe AccessAccountsController do
  describe "POST create" do
    context "with valid email" do
      it "redirects to the sent email page" do
        luke = Fabricate(:giver, email: "darknet@example.com")
        post :create, email: luke.email
        expect(response).to redirect_to access_account_path luke.id
      end

      it "sends the reset email" do
        luke = Fabricate(:giver)
        post :create, email: luke.email
        expect(ActionMailer::Base.deliveries.last.to).to eq([luke.email])
      end

      it "sets the token" do
        luke = Fabricate(:giver)
        post :create, email: luke.email
        expect(luke.reload.token).not_to be_nil
      end
    end

    context "with invalid email" do
      after { ActionMailer::Base.deliveries.clear }

      it "redirects to the forgot password path" do
        luke = Fabricate(:giver, email: "darknet@example.com")
        post :create, email: "bad@email.com"
        expect(response).to redirect_to new_access_account_path
      end

      it "does not send the reset email" do
        luke = Fabricate(:giver, email: "darknet@example.com")
        post :create, email: "bad@email.com"
        expect(ActionMailer::Base.deliveries).to be_empty
      end

      it "sets the flash danger message" do
        luke = Fabricate(:giver, email: "darknet@example.com")
        post :create, email: "bad@email.com"
        expect(flash[:danger]).to be_present
      end

      it "does not set token" do
        luke = Fabricate(:giver, email: "darknet@example.com")
        post :create, email: "bad@email.com"
        expect(luke.reload.token).to be_nil
      end
    end
  end
end
