class AddTitleToBookLists < ActiveRecord::Migration
  def change
    add_column :book_lists, :title, :string
  end
end
