class Review < ActiveRecord::Base
  attr_accessible :content, :rating, :title

  opinio_subjectum

  belongs_to :user
  belongs_to :book

end
