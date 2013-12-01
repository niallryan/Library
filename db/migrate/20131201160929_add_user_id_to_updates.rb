class AddUserIdToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :user_id, :integer
    add_index :updates, :user_id
    remove_column :updates, :name
  end
end
