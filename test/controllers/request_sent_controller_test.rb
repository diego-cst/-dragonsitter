require 'test_helper'

class RequestSentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get request_sent_index_url
    assert_response :success
  end

end
