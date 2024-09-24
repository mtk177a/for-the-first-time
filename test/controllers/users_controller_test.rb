require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
    post users_path, params: { user: { email: "test@example.com", password: "password", password_confirmation: "password" } }
    assert_response :redirect  # 正常に作成されたらリダイレクト
    follow_redirect!
    assert_response :success  # リダイレクト後のページが正常に表示されるか確認
  end
end
