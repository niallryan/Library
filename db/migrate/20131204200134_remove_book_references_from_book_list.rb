class RemoveBookReferencesFromBookList < ActiveRecord::Migration
  def up
    remove_column :book_lists, :book_id
  end

  def down
    add_column :book_lists, :book_id
  end
end
