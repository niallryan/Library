class Review < ActiveRecord::Base
  attr_accessible :content, :rating, :title, :book_id, :user_id, :book_ids

  opinio_subjectum

  belongs_to :user
  belongs_to :book

end