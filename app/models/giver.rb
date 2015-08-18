class Giver < ActiveRecord::Base
  include Tokenable

  validates :full_name, :message, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password validations: false
  has_many :donations
end
