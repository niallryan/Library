class Review < ActiveRecord::Base
  attr_accessible :content, :rating, :title

  belongs_to :user
  belongs_to :book

end
