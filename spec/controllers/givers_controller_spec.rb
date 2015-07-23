require 'spec_helper'

describe GiversController do
  describe "GET new" do
    it "sets the giver" do
      get :new
      expect(assigns(:giver)).to be_instance_of(Giver)
    end
  end

  describe "POST create" do
    context "with valid info" do
      before do
        transaction = double('transaction')
        transaction.stub(:success?).and_return(true)
        BraintreeWrapper::Transaction.stub(:sale).and_return(transaction)

        post :create, giver: {
          full_name: "Smeagol",
          message: "preciousssssss",
          email: "smeaogl@goblin_town.com",
          amount: "100.00",
          payment_method_nonce: "This works?"
        }
      end

      it "saves the donor" do
        expect(Giver.count).to eq 1
      end

      it "sets the flash message" do
        expect(flash[:success]).to be_present
      end

      it "sets the giver in the session" do
        expect(session[:giver_id]).to eq(Giver.first.id)
      end
    end

    context "with invalid info" do
      before do
        post :create, giver: { message: "preciousssssss" }
      end

      it "renders the new path" do
        expect(response).to render_template :new
      end

      it "does not save the donor" do
        expect(Giver.count).to eq 0
      end

      it "sets the flash error message" do
        expect(flash[:danger]).to be_present
      end
    end
  end
end
