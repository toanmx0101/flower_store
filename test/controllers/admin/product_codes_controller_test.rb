require 'test_helper'

class Admin::ProductCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_product_code = admin_product_codes(:one)
  end

  test "should get index" do
    get admin_product_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_code_url
    assert_response :success
  end

  test "should create admin_product_code" do
    assert_difference('Admin::ProductCode.count') do
      post admin_product_codes_url, params: { admin_product_code: { status: @admin_product_code.status, store_id: @admin_product_code.store_id } }
    end

    assert_redirected_to admin_product_code_url(Admin::ProductCode.last)
  end

  test "should show admin_product_code" do
    get admin_product_code_url(@admin_product_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_code_url(@admin_product_code)
    assert_response :success
  end

  test "should update admin_product_code" do
    patch admin_product_code_url(@admin_product_code), params: { admin_product_code: { status: @admin_product_code.status, store_id: @admin_product_code.store_id } }
    assert_redirected_to admin_product_code_url(@admin_product_code)
  end

  test "should destroy admin_product_code" do
    assert_difference('Admin::ProductCode.count', -1) do
      delete admin_product_code_url(@admin_product_code)
    end

    assert_redirected_to admin_product_codes_url
  end
end
