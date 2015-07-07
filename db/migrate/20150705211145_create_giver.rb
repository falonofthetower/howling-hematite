class CreateGiver < ActiveRecord::Migration
  def change
    create_table :givers do |t|
      t.string :full_name
      t.string :message
      t.timestamps
    end
  end
end
