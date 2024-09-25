require "test_helper"

class PublicRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_records_path
    assert_response :success
  end
end
