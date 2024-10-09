require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # fixtureのユーザーを使用する
    post login_path, params: { email: @user.email, password: "password" } # 適切なログイン情報を入力
  end

  test "should get show" do
    get profile_path(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_path(@user)
    assert_response :success
  end

  test "should update profile" do
    patch profile_path(@user), params: { user: { name: "Updated name" } }
    assert_redirected_to profile_path(@user) # 正しいリダイレクト先を確認

    # 更新後のユーザー名が変更されているかを確認
    @user.reload
    assert_equal "Updated name", @user.name
  end
end
