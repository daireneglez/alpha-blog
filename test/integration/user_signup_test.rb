require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "signup a new user successfully" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "johndoe", email: "johndoe@examle.com", password: "password", admin: true } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success

    assert_match "Welcome to the Alpha Blog", response.body
  end
end
