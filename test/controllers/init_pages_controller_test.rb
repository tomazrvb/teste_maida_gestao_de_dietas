require 'test_helper'

class InitPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get init_pages_login_url
    assert_response :success
  end

  test "should get new_acount" do
    get init_pages_new_acount_url
    assert_response :success
  end

end
