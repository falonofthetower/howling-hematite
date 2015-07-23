require 'spec_helper'

feature "giver donates to cause", :js, :vcr do
  background do
    visit new_giver_path
  end

  scenario "with valid amount and valid giver info" do
    giver = Fabricate.build(:giver)
    fill_in "Full Name", with: giver.full_name
    fill_in "Email Address", with: giver.email
    fill_in "Public name on the donation", with: giver.message
    fill_in "Cardholder name", with: giver.full_name
    fill_in "Card number", with: "4111 1111 1111 1111"
    fill_in "Cvv number", with: "123"
    fill_in "Month", with: "10"
    fill_in "Year", with: "20"
    click_button "Donate"
    expect(page).to have_content(giver.email)
  end
  scenario "with valid amount and invalid giver data"
  scenario "with invalid amount and valid giver info"
  scenario "with invalid amount and invalid giver info"
end
