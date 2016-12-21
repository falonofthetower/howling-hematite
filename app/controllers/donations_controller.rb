class DonationsController < ApplicationController
  def index
    @total = Donation.total - 5360
    @giver_count = Giver.unique_count - 30
  end
end
