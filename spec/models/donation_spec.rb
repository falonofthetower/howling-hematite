require 'spec_helper'

describe Donation do
  it { should belong_to(:giver) }

  describe "#total" do
    it "returns the sum of the donations" do
      Fabricate(:donation, amount: "100")
      Fabricate(:donation, amount: "222.00")
      Fabricate(:donation, amount: "300.33")

      expect(Donation.total).to eq("622.33")
    end
  end
end
