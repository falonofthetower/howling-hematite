class Giver < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :address, :city, :state, :zip, presence: true
  has_many :donations

  def self.unique_count
    uniq.pluck(:email).count
  end

  def subscribe?
    self.mailing_list == true
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
