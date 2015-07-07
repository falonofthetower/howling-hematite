class Giver < ActiveRecord::Base
  validates_presence_of :full_name, :message
end
