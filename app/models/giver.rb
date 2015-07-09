class Giver < ActiveRecord::Base
  validates_presence_of :full_name, :message

  has_secure_password validations: false
end
