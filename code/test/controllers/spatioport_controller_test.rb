require 'test_helper'

class SpatioportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spatioport_index_url
    assert_response :success
  end

  test "should get buy" do
    get spatioport_buy_url
    assert_response :success
  end

end
