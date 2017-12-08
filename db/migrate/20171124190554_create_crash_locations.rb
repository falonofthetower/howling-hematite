class CreateCrashLocations < ActiveRecord::Migration
  def change
    create_table :crash_locations do |t|
      t.float :lat
      t.float :lng
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
