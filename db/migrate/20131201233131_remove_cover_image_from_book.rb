class RemoveCoverImageFromBook < ActiveRecord::Migration
  def up
    remove_column :books, :cover_image
  end

  def down
    add_column :books, :cover_image
  end
end
