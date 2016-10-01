require 'test_helper'

class ValidateSuggestedBrandControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
  end

  test "should get index" do
    get validate_suggested_brand_index_url
    assert_response :success
  end

end
