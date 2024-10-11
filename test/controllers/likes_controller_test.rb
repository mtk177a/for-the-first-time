require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  # 必要なフィクスチャをロード
  fixtures :users, :records, :likes

  setup do
    @user = users(:one)
    @record = records(:one)
    login_as(@user)
  end

  test "should create like" do
    assert_difference("Like.count", 1) do
      post record_like_path(@record), params: { record_id: @record.id }
    end
    assert_response :redirect # 成功後のリダイレクト確認
    follow_redirect! # リダイレクト先の確認
  end

  test "should destroy like" do
    like = @user.likes.create(record: @record) # テスト用の「いいね」を作成
    assert_difference("Like.count", -1) do
      delete record_like_path(@record), params: { id: like.id }, as: :turbo_stream
    end
    assert_response :success
  end

  private

  def login_as(user)
    post login_path, params: { email: user.email, password: "password" }
  end
end
