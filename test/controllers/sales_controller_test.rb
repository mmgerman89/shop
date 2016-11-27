require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @sale = sales(:one)
    @sale2 = Sale.new(number: 159, date: '20161001')
  end

  test "should get index" do
    get sales_url
    assert_response :success
  end

  test "should get new" do
    assert_difference('Sale.count') do
      get new_sale_url
    end
    assert_response :success
  end

  test "should create sale" do
    post sales_url, params: { id: @sale.id, sale: { date: @sale.date, number: @sale.number } }

    assert_redirected_to sales_url
  end

  test "should show sale" do
    get sale_url(@sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_url(@sale)
    assert_response :success
  end

  test "should update sale" do
    patch sale_url(@sale), params: { sale: { date: @sale.date, number: @sale.number } }
    assert_redirected_to sales_url
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete sale_url(@sale)
    end

    assert_redirected_to sales_url
  end
end
