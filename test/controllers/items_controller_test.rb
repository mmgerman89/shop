require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @item = items(:one)
    category = categories(:one)
    category.save
    brand = brands(:one)
    brand.save
    unit = units(:one)
    unit.save
    @item2 = Item.new(code: "125", description: "Artículo 2", brand_id: brand.id, unit_id: unit.id,
                stock: 1, min_stock: 1, category_id: category.id, price: 35.5)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { brand_id: @item2.brand_id, category_id: @item2.category_id,
                                        code: @item2.code, description: @item2.description, 
                                        min_stock: @item2.min_stock, stock: @item2.stock, 
                                        unit_id: @item2.unit_id, price: @item2.price } }
    end

    assert_redirected_to items_url
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item.id), params: { item: { brand_id: @item.brand_id, category_id: @item.category_id, code: @item.code, description: @item.description, min_stock: @item.min_stock, stock: @item.stock, unit_id: @item.unit_id } }
    assert_response :success
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
