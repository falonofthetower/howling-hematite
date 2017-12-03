class AddDateAndUrlToCrashLocation < ActiveRecord::Migration
  def change
    add_column :crash_locations, :date, :date
    add_column :crash_locations, :url_address, :string
    add_column :crash_locations, :url_title, :string
  end
end
