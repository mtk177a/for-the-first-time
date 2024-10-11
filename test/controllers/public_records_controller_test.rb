require "test_helper"

class PublicRecordsControllerTest < ActionDispatch::IntegrationTest
  # 必要なフィクスチャをロード
  fixtures :users, :records, :likes

  setup do
    @user = users(:one)
    login_as(@user) # ログイン処理を追加
  end

  test "should get index" do
    get public_records_path
    assert_response :success
  end

  private

  def login_as(user)
    post login_path, params: { email: user.email, password: 'password' } # 適切なパスワードを設定
  end
end
