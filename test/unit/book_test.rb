require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "a book should have a title" do
    book = Book.new
    assert !book.save
    assert !book.errors[:title].empty?
  end

end
