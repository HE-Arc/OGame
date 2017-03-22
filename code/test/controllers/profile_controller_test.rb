require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get profile_user_url
    assert_response :success
  end

end
