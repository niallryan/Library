class Review < ActiveRecord::Base
  attr_accessible :content, :rating, :title, :book_id, :user_id

  opinio_subjectum

  belongs_to :user
  belongs_to :book

  validates :title, presence: true,
                    uniqueness: true

  validates :content, presence: true

  validates :rating, presence: true

  validates :user_id, presence: true

end