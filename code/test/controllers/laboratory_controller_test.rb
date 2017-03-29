require 'test_helper'

class LaboratoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laboratory_index_url
    assert_response :success
  end

  test "should get show" do
    get laboratory_show_url
    assert_response :success
  end

end
