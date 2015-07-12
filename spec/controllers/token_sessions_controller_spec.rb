require 'spec_helper'

describe TokenSessionsController do
  describe "POST create" do
    context "with valid token" do
      let(:luke) { Fabricate(:giver, token: "token") }
      before do
        post :create, token: luke.token
      end

      it "redirects to the show giver path" do
        expect(response).to redirect_to giver_path(luke.id)
      end

      it "puts the giver in the session" do
        expect(session[:giver_id]).to eq luke.id
      end

      it "destroys the token for the user" do
        expect(Giver.last.token).to be_nil
      end

      it "sets the flash message" do
        expect(flash[:success]).to be_present
      end
    end

    context "with expired or invalid token" do
      before do
        session[:giver_id] = "delete me"
        post :create, token: "bad_token"
      end

      it "redirects to the root path" do
        expect(response).to redirect_to new_access_account_path
      end

      it "sets the giver in session to blank" do
        expect(session[:giver_id]).to be_nil
      end

      it "sets the danger message" do
        expect(flash[:danger]).to be_present
      end
    end
  end
end
