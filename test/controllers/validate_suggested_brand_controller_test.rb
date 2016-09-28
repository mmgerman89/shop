require 'test_helper'

class ValidateSuggestedBrandControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get validate_suggested_brand_index_url
    assert_response :success
  end

end
