class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title, :image, :user_id, :description

  has_and_belongs_to_many :user

end
