require 'test_helper'

class Admin::ProductDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_product_detail = admin_product_details(:one)
  end

  test "should get index" do
    get admin_product_details_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_detail_url
    assert_response :success
  end

  test "should create admin_product_detail" do
    assert_difference('Admin::ProductDetail.count') do
      post admin_product_details_url, params: { admin_product_detail: { code: @admin_product_detail.code, discount: @admin_product_detail.discount, new: @admin_product_detail.new, price: @admin_product_detail.price, product_id: @admin_product_detail.product_id, type_product: @admin_product_detail.type_product } }
    end

    assert_redirected_to admin_product_detail_url(Admin::ProductDetail.last)
  end

  test "should show admin_product_detail" do
    get admin_product_detail_url(@admin_product_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_detail_url(@admin_product_detail)
    assert_response :success
  end

  test "should update admin_product_detail" do
    patch admin_product_detail_url(@admin_product_detail), params: { admin_product_detail: { code: @admin_product_detail.code, discount: @admin_product_detail.discount, new: @admin_product_detail.new, price: @admin_product_detail.price, product_id: @admin_product_detail.product_id, type_product: @admin_product_detail.type_product } }
    assert_redirected_to admin_product_detail_url(@admin_product_detail)
  end

  test "should destroy admin_product_detail" do
    assert_difference('Admin::ProductDetail.count', -1) do
      delete admin_product_detail_url(@admin_product_detail)
    end

    assert_redirected_to admin_product_details_url
  end
end
