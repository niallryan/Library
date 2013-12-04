class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title, :image, :user_id, :description

  belongs_to :user
  has_many :reviews

end
