class RemoveAdminPasswordFromGivers < ActiveRecord::Migration
  def change
    remove_column :givers, :password_digest, :string
    remove_column :givers, :admin, :string
  end
end
