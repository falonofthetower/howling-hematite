class Admin < ActiveRecord::Base
  validates :username, presence: true
  has_secure_password
end
