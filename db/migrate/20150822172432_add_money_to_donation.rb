class AddMoneyToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :amount, :decimal, precision: 50, scale: 2
  end
end
