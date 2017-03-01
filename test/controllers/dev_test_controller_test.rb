require 'test_helper'

class DevTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dev_test_index_url
    assert_response :success
  end

end
