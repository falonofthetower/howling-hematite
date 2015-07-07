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
        post :create, giver: { full_name: "Smeagol", message: "preciousssssss" }
      end

      it "redirects to the home page" do
        expect(response).to redirect_to home_path
      end

      it "saves the donor" do
        expect(Giver.count).to eq 1
      end

      it "sets the flash message" do
        expect(flash[:success]).to be_present
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
