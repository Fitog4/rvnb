require 'test_helper'

class RvsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rvs_show_url
    assert_response :success
  end

  test "should get new" do
    get rvs_new_url
    assert_response :success
  end

end
