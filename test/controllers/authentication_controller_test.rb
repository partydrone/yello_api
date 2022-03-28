require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post auth_path, params: { username: "user1", password: "password" }
    assert_response :success
  end
end
