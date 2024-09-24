require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should create session" do
    post login_path, params: { email: "test@example.com", password: "password" }
    assert_response :redirect
  end

  test "should destroy session" do
    delete logout_path
    assert_response :redirect
  end
end
