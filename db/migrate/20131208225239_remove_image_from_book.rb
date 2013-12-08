class RemoveImageFromBook < ActiveRecord::Migration
  def up
    remove_column :books, :image
  end

  def down
    add_column :books, :image, :string
  end

end
