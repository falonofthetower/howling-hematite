class DonationsController < ApplicationController
  def index
    @total = (Donation.total.to_f - 5040).to_s
    @giver_count = Giver.unique_count - 24
  end
end
