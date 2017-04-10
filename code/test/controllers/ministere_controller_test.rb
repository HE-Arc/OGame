require 'test_helper'

class MinistereControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ministere_index_url
    assert_response :success
  end

  test "should get buy" do
    get ministere_buy_url
    assert_response :success
  end

end
