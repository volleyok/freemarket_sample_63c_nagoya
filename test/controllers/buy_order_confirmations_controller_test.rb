require 'test_helper'

class BuyOrderConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get buy_order_confirmations_show_url
    assert_response :success
  end

end
