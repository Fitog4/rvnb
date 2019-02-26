require 'test_helper'

class BookingRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get booking_requests_new_url
    assert_response :success
  end

  test "should get show" do
    get booking_requests_show_url
    assert_response :success
  end

end
