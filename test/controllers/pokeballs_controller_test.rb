require "test_helper"

class PokeballsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get pokeballs_destroy_url
    assert_response :success
  end
end
