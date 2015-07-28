class AddAmountToGivers < ActiveRecord::Migration
  def change
    add_column :givers, :amount, :string
  end
end
