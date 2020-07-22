require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get myfeed" do
    get users_myfeed_url
    assert_response :success
  end

end
