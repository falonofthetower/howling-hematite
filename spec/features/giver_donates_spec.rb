require 'spec_helper'

feature "giver donates to cause", :js, :vcr do
  background do
    visit new_giver_path
  end

  scenario "with valid amount and valid giver info" do
    fill_in_valid_giver
    fill_in_valid_card "100"
    click_button "Donate"
    expect(page).to have_content("Thank you")
  end

  scenario "with valid amount and invalid giver data" do
    fill_in_invalid_giver
    fill_in_valid_card "100"
    click_button "Donate"
    expect(page).to have_content("Your info")
  end

  scenario "with invalid amount and valid giver data" do
    fill_in_valid_giver
    fill_in_valid_card "2001"
    click_button "Donate"
    expect(page).to have_content("There was a problem")
  end

  scenario "with invalid amount and invalid giver data" do
    fill_in_valid_giver
    fill_in_valid_card "2000"
    click_button "Donate"
    expect(page).to have_content("There was a problem")
  end

  scenario "with valid giver data and invalid card" do
    fill_in_valid_giver
    fill_in_invalid_card "100"
    click_button "Donate"
    expect(page).to have_content("Credit card number is invalid.")
  end

  def fill_in_valid_giver
    giver = Fabricate.build(:giver)
    fill_in "Full Name", with: giver.full_name
    fill_in "Public name on the donation", with: giver.message
    fill_in "Email Address", with: giver.email
    fill_in "Cardholder name", with: giver.full_name
  end

  def fill_in_invalid_giver
    giver = Fabricate.build(:giver)
    fill_in "Full Name", with: giver.full_name
    fill_in "Public name on the donation", with: giver.message
    fill_in "Cardholder name", with: giver.full_name
  end

  def fill_in_valid_card(amount)
    fill_in "Amount", with: amount
    fill_in "Card number", with: "4111 1111 1111 1111"
    fill_in "Cvv number", with: "123"
    fill_in "Month", with: "10"
    fill_in "Year", with: "20"
  end

  def fill_in_invalid_card(amount)
    fill_in "Amount", with: amount
    fill_in "Card number", with: "4739 3935 3953 9395"
    fill_in "Cvv number", with: "123"
    fill_in "Month", with: "10"
    fill_in "Year", with: "20"
  end
end
