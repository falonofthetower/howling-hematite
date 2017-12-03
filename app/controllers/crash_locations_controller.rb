class CrashLocationsController < ApplicationController
  layout "admin"

  def index
    gon.locations = retrieve_locations
  end

  private

  def retrieve_locations
    CrashLocation.all
      .to_map_objects
      .map { |l| l.to_json }
  end
end
