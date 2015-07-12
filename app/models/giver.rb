class Giver < ActiveRecord::Base
  include Tokenable

  validates_presence_of :full_name, :message, :email
  validates_uniqueness_of :email
  has_secure_password validations: false
end
