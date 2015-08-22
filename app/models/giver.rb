class Giver < ActiveRecord::Base
  validates :full_name, :message, :email, presence: true
  has_many :donations

  def self.unique_count
    uniq.pluck(:email).count
  end
end
