class AddFavouriteBookToUser < ActiveRecord::Migration
  def change
    add_column :users, :favourite_book, :string
  end
end
