class AddUserIdToBookLists < ActiveRecord::Migration
  def change
    add_column :book_lists, :user_id, :integer
    add_index :book_lists, :user_id
  end
end
