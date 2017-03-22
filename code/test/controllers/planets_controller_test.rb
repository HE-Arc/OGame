require 'test_helper'

class PlanetsControllerTest < ActionDispatch::IntegrationTest
  test "should get planet" do
    get planets_planet_url
    assert_response :success
  end

end
