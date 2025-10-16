require "test_helper"

class TrainersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get trainers_show_url
    assert_response :success
  end
end
