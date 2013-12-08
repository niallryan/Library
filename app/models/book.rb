class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title, :cover_image, :user_id, :description, :book_list_id

  opinio_subjectum

  belongs_to :user
  belongs_to :book_list
  # acts_as_list scope: :book_list
  has_many :reviews

  has_attached_file :cover_image

end
