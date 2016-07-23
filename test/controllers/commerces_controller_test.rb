require 'test_helper'

class CommercesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commerce = commerces(:one)
  end

  test "should get index" do
    get commerces_url
    assert_response :success
  end

  test "should get new" do
    get new_commerce_url
    assert_response :success
  end

  test "should create commerce" do
    assert_difference('Commerce.count') do
      post commerces_url, params: { commerce: { name: @commerce.name, user_id: @commerce.user_id } }
    end

    assert_redirected_to commerce_url(Commerce.last)
  end

  test "should show commerce" do
    get commerce_url(@commerce)
    assert_response :success
  end

  test "should get edit" do
    get edit_commerce_url(@commerce)
    assert_response :success
  end

  test "should update commerce" do
    patch commerce_url(@commerce), params: { commerce: { name: @commerce.name, user_id: @commerce.user_id } }
    assert_redirected_to commerce_url(@commerce)
  end

  test "should destroy commerce" do
    assert_difference('Commerce.count', -1) do
      delete commerce_url(@commerce)
    end

    assert_redirected_to commerces_url
  end
end
