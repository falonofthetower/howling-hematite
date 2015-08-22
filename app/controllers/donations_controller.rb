class DonationsController < ApplicationController
  def index
    @total = Donation.total
    @giver_count = Giver.unique_count
  end
end
