class AddForSaleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :for_sale, :boolean, :default => false
  end
end
