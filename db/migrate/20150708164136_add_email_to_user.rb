class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :givers, :email, :string
  end
end
