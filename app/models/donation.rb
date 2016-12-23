class Donation < ActiveRecord::Base
  belongs_to :giver

  scope :current_campaign, -> { where.not('donations.created_at' => nil) }

  def self.total
    all.sum(:amount).to_s
  end
end
