class Donation < ActiveRecord::Base
  belongs_to :giver

  def self.total
    all.sum(:amount).to_s
  end
end
