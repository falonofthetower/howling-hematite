require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template(:new)
    end

    it "redirects to the admin page for authenticated users" do
      session[:admin_id] = Fabricate(:admin)
      get :new
      expect(response).to redirect_to admin_gifts_path
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      let(:naruto) { Fabricate(:admin) }
      before do
        post :create, username: naruto.username, password: naruto.password
      end

      it "redirects to the admin path" do
        expect(response).to redirect_to admin_gifts_path
      end

      it "puts the admin in the session" do
        expect(session[:admin_id]).to eq(naruto.id)
      end
    end

    context "with invalid credentials" do
      before do
        post :create, username: "king of theives", password: "death of fools"
      end

      it "does not put the admin in the session" do
        expect(session[:admin_id]).to be_nil
      end

      it "renders the new page" do
        expect(response).to redirect_to sign_in_path
      end

      it "sets the flash message" do
        expect(flash[:error]).not_to be_blank
      end
    end
  end
end
