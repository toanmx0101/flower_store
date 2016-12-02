require 'test_helper'

class Admin::PricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_price = admin_prices(:one)
  end

  test "should get index" do
    get admin_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_price_url
    assert_response :success
  end

  test "should create admin_price" do
    assert_difference('Admin::Price.count') do
      post admin_prices_url, params: { admin_price: { cost: @admin_price.cost, discount: @admin_price.discount, new: @admin_price.new, product_detail_id: @admin_price.product_detail_id } }
    end

    assert_redirected_to admin_price_url(Admin::Price.last)
  end

  test "should show admin_price" do
    get admin_price_url(@admin_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_price_url(@admin_price)
    assert_response :success
  end

  test "should update admin_price" do
    patch admin_price_url(@admin_price), params: { admin_price: { cost: @admin_price.cost, discount: @admin_price.discount, new: @admin_price.new, product_detail_id: @admin_price.product_detail_id } }
    assert_redirected_to admin_price_url(@admin_price)
  end

  test "should destroy admin_price" do
    assert_difference('Admin::Price.count', -1) do
      delete admin_price_url(@admin_price)
    end

    assert_redirected_to admin_prices_url
  end
end
