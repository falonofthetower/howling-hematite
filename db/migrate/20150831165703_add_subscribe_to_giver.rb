class AddSubscribeToGiver < ActiveRecord::Migration
  def change
    add_column :givers, :mailing_list, :boolean
  end
end
