require 'test_helper'

class UpdateTest < ActiveSupport::TestCase

  test "an update should have content" do
    update = Update.new
    assert !update.save
    assert !update.errors[:content].empty?
  end



end
