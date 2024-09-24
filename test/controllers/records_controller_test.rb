require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  # setup メソッドで事前にログインを行う
  setup do
    @user = users(:one) # fixtureのユーザーを使用する
    post login_path, params: { email: @user.email, password: "password" } # 適切なログイン情報を入力
  end

  test "should get index" do
    get records_path
    assert_response :success
  end

  test "should get new" do
    get new_record_path
    assert_response :success
  end

  test "should create record" do
    post records_path, params: { record: { title: "Test", memo: "Test memo", date: "2024-09-24" } }
    assert_response :redirect
  end

  test "should get edit" do
    record = records(:one) # 必要に応じてfixtureを作成
    get edit_record_path(record)
    assert_response :success
  end

  test "should update record" do
    record = records(:one) # 必要に応じてfixtureを作成
    patch record_path(record), params: { record: { title: "Updated title" } }
    assert_response :redirect
  end

  test "should destroy record" do
    record = records(:one) # 必要に応じてfixtureを作成
    delete record_path(record)
    assert_response :redirect
  end
end
