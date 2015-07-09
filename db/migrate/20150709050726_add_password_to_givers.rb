class AddPasswordToGivers < ActiveRecord::Migration
  def change
    add_column :givers, :password_digest, :string
  end
end
