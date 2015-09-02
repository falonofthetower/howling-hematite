class Giver < ActiveRecord::Base
  validates :full_name, :email, presence: true
  has_many :donations

  def self.unique_count
    uniq.pluck(:email).count
  end

  def subscribe?
    self.mailing_list == true
  end
end
