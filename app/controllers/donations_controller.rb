class DonationsController < ApplicationController
  def index
    @total = Donation.current_campaign.total
    @giver_count = Donation.current_campaign.count
  end
end
