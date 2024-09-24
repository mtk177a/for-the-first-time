require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)  # fixturesに設定されているユーザーを参照
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should create session" do
    post login_path, params: { email: @user.email, password: 'password' }
    assert_response :redirect
  end

  test "should destroy session" do
    delete logout_path
    assert_response :redirect
  end
end
