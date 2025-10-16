require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pokemons_show_url
    assert_response :success
  end
end
