class CrashLocation < ActiveRecord::Base
  def self.to_map_objects
    crash_locations = self.all
    crash_locations.map { |crash_location| MapObject.new(crash_location).format }
  end
end
