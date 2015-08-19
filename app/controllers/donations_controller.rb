class DonationsController < AdminController
  def index
    @donations = Donation.all
  end
end
