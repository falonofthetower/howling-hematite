require 'spec_helper'

describe Giver do
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }

  describe "#count" do
    it "returns the the count for a giver" do
      Fabricate(:giver, email: "frodo@shire.com")

      expect(Giver.unique_count).to eq(1)
    end

    it "returns the count for multiple givers" do
      Fabricate(:giver, email: "frodo@shire.com")
      Fabricate(:giver, email: "sam@shire.com")

      expect(Giver.unique_count).to eq(2)
    end
    it "returns the count of unique givers by email" do
      Fabricate(:giver, email: "frodo@shire.com")
      Fabricate(:giver, email: "sam@shire.com")
      Fabricate(:giver, email: "frodo@shire.com")

      expect(Giver.unique_count).to eq(2)
    end
  end
end
