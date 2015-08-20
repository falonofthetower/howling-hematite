class RemoveTokenFromGivers < ActiveRecord::Migration
  def change
    remove_column :givers, :token, :string
  end
end
