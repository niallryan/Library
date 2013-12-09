class CreateBookListItems < ActiveRecord::Migration
  def change
    create_table :book_list_items do |t|
      t.integer :book_list_id
      t.integer :book_id
      t.timestamps
    end

    add_index :book_list_items, [:book_id, :book_list_id]
  end

end
