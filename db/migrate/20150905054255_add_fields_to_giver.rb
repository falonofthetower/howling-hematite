class AddFieldsToGiver < ActiveRecord::Migration
  def change
    add_column :givers, :first_name, :string
    add_column :givers, :last_name, :string
    add_column :givers, :address, :string
    add_column :givers, :city, :string
    add_column :givers, :state, :string
    add_column :givers, :zip, :string

    remove_column :givers, :full_name, :string
  end
end
