require 'test_helper'

class Admin::SpecialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_special = admin_specials(:one)
  end

  test "should get index" do
    get admin_specials_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_special_url
    assert_response :success
  end

  test "should create admin_special" do
    assert_difference('Admin::Special.count') do
      post admin_specials_url, params: { admin_special: { product_id: @admin_special.product_id } }
    end

    assert_redirected_to admin_special_url(Admin::Special.last)
  end

  test "should show admin_special" do
    get admin_special_url(@admin_special)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_special_url(@admin_special)
    assert_response :success
  end

  test "should update admin_special" do
    patch admin_special_url(@admin_special), params: { admin_special: { product_id: @admin_special.product_id } }
    assert_redirected_to admin_special_url(@admin_special)
  end

  test "should destroy admin_special" do
    assert_difference('Admin::Special.count', -1) do
      delete admin_special_url(@admin_special)
    end

    assert_redirected_to admin_specials_url
  end
end
