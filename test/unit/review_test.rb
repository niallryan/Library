require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test "a review should have a title" do
    review = Review.new
    assert !review.save
    assert !review.errors[:title].empty?
  end

end
