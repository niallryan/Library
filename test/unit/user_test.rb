require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/writing-tests/validating-presence
  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/writing-tests/validating-uniqueness
  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:niall).profile_name

    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/writing-tests/validating-format-2
  test "a user should have a profile name without spaces" do
    user = User.new(email: "a_user@email.com")
    user.password = user.password_confirmation = "password"

    user.profile_name = "A Name With Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/building-the-profile-page/testing-the-profile-name-2
  test "a user can have a correctly formatted profile name" do
    user = User.new(email: "a_user@email.com")
    user.password = user.password_confirmation = "password"

    user.profile_name = "user_profile_name"
    assert user.valid?
  end

end