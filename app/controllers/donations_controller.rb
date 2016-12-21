class DonationsController < ApplicationController
  def index
    @total = (Donation.total.to_f - 5360).to_s
    @giver_count = Giver.unique_count - 30
  end
end
