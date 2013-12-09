class BookListItem < ActiveRecord::Base
  # http://stackoverflow.com/questions/15737009/using-join-models-in-rails-adding-an-item-to-a-list

  attr_accessible :book_list, :book, :book_list_id, :book_id

  belongs_to :book_list
  belongs_to :book

end
