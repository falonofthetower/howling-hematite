shared_examples "requires admin" do
  it "redirects to the root page" do
    session[:admin_id] = nil
    action
    expect(response).to redirect_to root_path
  end
end
