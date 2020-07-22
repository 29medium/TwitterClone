require 'test_helper'

class BirdsControllerTest < ActionDispatch::IntegrationTest
  test "should get myshow" do
    get birds_myshow_url
    assert_response :success
  end

end
