require 'test_helper'

class UnitsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @unit = units(:one)
    @unit2 = Unit.new(name: "Ejemplo")
  end

  test "should get index" do
    get units_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_url
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post units_url, params: { unit: { name: @unit2.name } }
    end

    assert_redirected_to units_url
  end

  test "should show unit" do
    get unit_url(@unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_url(@unit)
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { name: @unit.name } }
    assert_redirected_to units_url
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete unit_url(@unit)
    end

    assert_redirected_to units_url
  end
end
