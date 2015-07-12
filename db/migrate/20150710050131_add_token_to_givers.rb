class AddTokenToGivers < ActiveRecord::Migration
  def change
    add_column :givers, :token, :string
  end
end
