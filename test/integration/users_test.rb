require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  test "users create creates a new user" do
  end

  test "users create does not create a user with a duplicate email" do
    # create user with email
    # submit new user form with same email
    # test that user.count == 1
  end
end
