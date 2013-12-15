class BookList < ActiveRecord::Base
  # http://stackoverflow.com/questions/15737009/using-join-models-in-rails-adding-an-item-to-a-list

  opinio_subjectum

  has_many :book_list_items
  has_many :books, through: :book_list_items
  belongs_to :user

  attr_accessible :title, :book_ids

  # simple_list = []
  #
  # def self.add_to_simple_list(list_item)
  #   simple_list << list_item
  # end

end
