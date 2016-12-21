require 'spec_helper'

describe Admin::GiftsController do
  describe "GET index" do
    it_behaves_like "requires admin" do
      let(:action) { get :index }
    end
  end
end
