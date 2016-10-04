require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:admin)
    @brand = brands(:one)
    @brand2 = Brand.new(name: "Marca de Prueba")
  end

  test "should get index" do
    get brands_url
    assert_response :success
  end

  test "should get new" do
    get new_brand_url
    assert_response :success
  end

  test "should create brand" do
    assert_difference('Brand.count') do
      post brands_url, params: { brand: { name: @brand2.name } }
    end

    #assert_redirected_to brands_url(Brand.last)
    assert_redirected_to brands_url
  end

  test "should show brand" do
    get brand_url(@brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_brand_url(@brand)
    assert_response :success
  end

  test "should update brand" do
    patch brand_url(@brand), params: { brand: { name: @brand.name } }
    assert_redirected_to brands_url
  end

  test "should destroy brand" do
    assert_difference('Brand.count', -1) do
      delete brand_url(@brand)
    end

    assert_redirected_to brands_url
  end
end
