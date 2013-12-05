class CreateBookLists < ActiveRecord::Migration
  def change
    drop_table :book_lists
    create_table :book_lists do |t|
      t.references :book

      t.timestamps
    end
    add_index :book_lists, :book_id
  end
end
