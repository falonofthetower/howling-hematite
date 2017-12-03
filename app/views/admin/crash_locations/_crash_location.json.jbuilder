json.extract! crash_location, :id, :lat, :lng, :title, :content, :created_at, :updated_at
json.url crash_location_url(crash_location, format: :json)
