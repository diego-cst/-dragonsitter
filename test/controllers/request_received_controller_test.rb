require 'test_helper'

class RequestReceivedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get request_received_index_url
    assert_response :success
  end

end
