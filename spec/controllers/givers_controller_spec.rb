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
      let(:giver) { Fabricate(:giver) }

      before do
        result = double(:donate_result, success?: true, giver: giver)
        GiverDonate.any_instance.should_receive(:donate).and_return(result)
        post :create, giver: Fabricate.attributes_for(:giver)
      end

      it "sets the flash message" do
        expect(flash[:success]).to be_present
      end

      it "sets the giver in the session" do
        expect(session[:giver_id]).to eq(giver.id)
      end

      it "redirects to the giver's path" do
        expect(response).to redirect_to(giver_path(giver.id))
      end
    end

    context "with invalid info" do
      before do
        result = double(:donate_result, success?: false, error_message: "this is failure")
        GiverDonate.any_instance.should_receive(:donate).and_return(result)
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

      it "does not put the giver in the session" do
        expect(session[:giver_id]).to be_nil
      end
    end
  end
end
