class Giver < ActiveRecord::Base
  validates :full_name, :message, :email, presence: true
  has_many :donations
end
