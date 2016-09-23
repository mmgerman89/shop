require 'test_helper'

class TownsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @town = towns(:one)
    @town2 = Town.new(name: "Moldes", code: 4426)
  end

  test "should get index" do
    get towns_url
    assert_response :success
  end

  test "should get new" do
    get new_town_url
    assert_response :success
  end

  test "should create town" do
    assert_difference('Town.count') do
      post towns_url, params: { town: { code: @town2.code, name: @town2.name } }
    end

    assert_redirected_to towns_url
  end

  test "should show town" do
    get town_url(@town)
    assert_response :success
  end

  test "should get edit" do
    get edit_town_url(@town)
    assert_response :success
  end

  test "should update town" do
    patch town_url(@town), params: { town: { code: @town.code, name: @town.name } }
    assert_redirected_to towns_url
  end

  test "should destroy town" do
    assert_difference('Town.count', -1) do
      delete town_url(@town)
    end

    assert_redirected_to towns_url
  end
end
