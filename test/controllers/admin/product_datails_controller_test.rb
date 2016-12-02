require 'test_helper'

class Admin::ProductDatailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_product_datail = admin_product_datails(:one)
  end

  test "should get index" do
    get admin_product_datails_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_datail_url
    assert_response :success
  end

  test "should create admin_product_datail" do
    assert_difference('Admin::ProductDatail.count') do
      post admin_product_datails_url, params: { admin_product_datail: { code: @admin_product_datail.code, color: @admin_product_datail.color, product_id: @admin_product_datail.product_id, quantity: @admin_product_datail.quantity, type: @admin_product_datail.type } }
    end

    assert_redirected_to admin_product_datail_url(Admin::ProductDatail.last)
  end

  test "should show admin_product_datail" do
    get admin_product_datail_url(@admin_product_datail)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_datail_url(@admin_product_datail)
    assert_response :success
  end

  test "should update admin_product_datail" do
    patch admin_product_datail_url(@admin_product_datail), params: { admin_product_datail: { code: @admin_product_datail.code, color: @admin_product_datail.color, product_id: @admin_product_datail.product_id, quantity: @admin_product_datail.quantity, type: @admin_product_datail.type } }
    assert_redirected_to admin_product_datail_url(@admin_product_datail)
  end

  test "should destroy admin_product_datail" do
    assert_difference('Admin::ProductDatail.count', -1) do
      delete admin_product_datail_url(@admin_product_datail)
    end

    assert_redirected_to admin_product_datails_url
  end
end
