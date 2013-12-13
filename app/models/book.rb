class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title, :cover_image, :user_id, :description, :book_list_id, :book_list_ids, :for_sale

  opinio_subjectum

  belongs_to :user

  # acts_as_list scope: :book_list
  has_many :reviews

  has_many :book_list_items
  has_many :book_lists, through: :book_list_items


  has_attached_file :cover_image

end
