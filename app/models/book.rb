class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title, :image, :user_id, :description, :book_list_id

  opinio_subjectum

  belongs_to :user
  belongs_to :book_list
  has_many :reviews

end
