require "test_helper"
require "active_record"
require "user"

class UserTest < ActiveSupport::TestCase
  def test_initialize_with_attributes
    user = User.new(id: 1, name: "Afif")
    assert_equal 1, user.id
    assert_equal "Afif", user.name
  end

  def test_find
    user = User.find(1)
    assert_kind_of User, user
    assert_equal 1, user.id
  end

  def test_all
    users = User.all
    assert_kind_of Array, users
    user = users.first
    assert_kind_of User, user
    assert_equal 1, user.id
  end
end
