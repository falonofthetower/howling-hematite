require 'spec_helper'

describe Giver do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }

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

  describe "#full_name" do
    it "returns the first and last name" do
      Fabricate(:giver, first_name: "Luke", last_name: "Skywalker")

      expect(Giver.last.full_name).to eq("Luke Skywalker")
    end
  end
end
