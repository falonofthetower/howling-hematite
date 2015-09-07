require 'spec_helper'

feature "giver donates to cause", :js, :vcr do
  background do
    visit new_giver_path
  end

  scenario "with valid amount and valid giver info" do
    fill_in_valid_giver
    fill_in_valid_card rand(100).to_s
    click_button "Donate"

    sleep(5)
    expect(page).to have_content("Thank you")
  end

  scenario "with valid amount and invalid giver data" do
    fill_in_valid_card "100"
    click_button "Donate"
    expect(page).to have_content("Please correct the errors")
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
    fill_in "First Name", with: giver.first_name
    fill_in "Last Name", with: giver.last_name
    fill_in "Street Address", with: giver.address
    fill_in "City", with: giver.city
    fill_in "State", with: giver.state
    fill_in "Zip", with: giver.zip
    fill_in "Email Address", with: giver.email
  end

  def fill_in_valid_card(amount)
    fill_in "Amount", with: amount
    within_frame("braintree-hosted-field-number") do
      fill_in "Credit Card Number", with: "4111 1111 1111 1111"
    end
    within_frame("braintree-hosted-field-cvv") do
      find(".cvv").set "123"
    end
    within_frame("braintree-hosted-field-expirationDate") do
      fill_in "Expiration Date", with: "1220"
    end
  end

  def fill_in_invalid_card(amount)
    fill_in "Amount", with: amount
    within_frame("braintree-hosted-field-number") do
      fill_in "Credit Card Number", with: "4739 3935 3953 9395"
    end
    within_frame("braintree-hosted-field-cvv") do
      find(".cvv").set "123"
    end
    within_frame("braintree-hosted-field-expirationDate") do
      fill_in "Expiration Date", with: "1220"
    end
  end
end
