require 'spec_helper'

feature "giver donates to cause", :js, :vcr do
  background do
    visit new_giver_path
  end

  scenario "with valid amount and valid giver info" do
    fill_in_valid_giver
    fill_in_valid_card rand(100).to_s
    click_button "Donate"

    expect(page).to have_content("Thank you")
  end

  scenario "with valid amount and invalid giver data" do
    fill_in_valid_card "100"
    expect(page).to have_content("We need a name")
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
    within_frame("braintree-hosted-field-number") do
      expect(page).to have_css("input.number.invalid")
    end
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

    expect(page).to have_css('iframe[name="braintree-hosted-field-number"]')
    page.driver.within_frame("braintree-hosted-field-number") do
      fill_in "Credit Card Number", with: "4111 1111 1111 1111"
    end
    expect(page).to have_css('iframe[name="braintree-hosted-field-cvv"]')
    within_frame("braintree-hosted-field-cvv") do
      find(".cvv").set "123"
    end
    expect(page).to have_css('iframe[name="braintree-hosted-field-expirationDate"]')
    within_frame("braintree-hosted-field-expirationDate") do
      fill_in "Expiration Date", with: "1220"
    end
  end

  def fill_in_invalid_card(amount)
    fill_in "Amount", with: amount
    expect(page).to have_css('iframe[name="braintree-hosted-field-number"]')
    within_frame("braintree-hosted-field-number") do
      fill_in "Credit Card Number", with: "4739 3935 3953 9395"
    end
    expect(page).to have_css('iframe[name="braintree-hosted-field-cvv"]')
    within_frame("braintree-hosted-field-cvv") do
      find(".cvv").set "123"
    end
    expect(page).to have_css('iframe[name="braintree-hosted-field-expirationDate"]')
    within_frame("braintree-hosted-field-expirationDate") do
      fill_in "Expiration Date", with: "1220"
    end
  end
end
