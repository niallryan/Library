class BookList < ActiveRecord::Base
  opinio_subjectum

  has_many :books
  belongs_to :user

  attr_accessible :title, :book_list_id

end
