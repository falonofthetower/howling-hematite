class AddAdminToGivers < ActiveRecord::Migration
  def change
    add_column :givers, :admin, :boolean
  end
end
