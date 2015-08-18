class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :giver_id
      t.string :transaction_id
      t.string :amount
    end
  end
end
