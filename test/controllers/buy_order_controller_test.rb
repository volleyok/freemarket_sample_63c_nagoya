require 'test_helper'

class BuyOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get buy_order_show_url
    assert_response :success
  end

end
