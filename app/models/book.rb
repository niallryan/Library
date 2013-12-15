class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title, :cover_image, :user_id, :description, :book_list_ids, :for_sale, :book_id

  opinio_subjectum

  belongs_to :user

  has_many :reviews

  has_many :book_list_items
  has_many :book_lists, through: :book_list_items

  has_attached_file :cover_image

  validates :title, presence: true,
                    uniqueness: true

  validates :author, presence: true

  validates :user_id, presence: true

  validates :ISBN, presence: true,
                   uniqueness: true

end
