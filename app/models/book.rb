class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :genre, :publisher, :title
end
