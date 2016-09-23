require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

end
