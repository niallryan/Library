class BookList < ActiveRecord::Base
  opinio_subjectum

  has_many :books #, -> { order("position DESC") }
  belongs_to :user

  attr_accessible :title, :book_list_id

end
