class BookList < ActiveRecord::Base
  # http://stackoverflow.com/questions/15737009/using-join-models-in-rails-adding-an-item-to-a-list

  opinio_subjectum

  has_many :book_list_items
  has_many :books, through: :book_list_items
  belongs_to :user

  attr_accessible :title, :book_list_id, :book_id, :book_ids, :book_list_ids

end
