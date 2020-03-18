require 'test_helper'

class WeightHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get dash" do
    get weight_histories_dash_url
    assert_response :success
  end

end
