require 'test_helper'

class Admin::FeaturedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_featured = admin_featureds(:one)
  end

  test "should get index" do
    get admin_featureds_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_featured_url
    assert_response :success
  end

  test "should create admin_featured" do
    assert_difference('Admin::Featured.count') do
      post admin_featureds_url, params: { admin_featured: { product_id: @admin_featured.product_id } }
    end

    assert_redirected_to admin_featured_url(Admin::Featured.last)
  end

  test "should show admin_featured" do
    get admin_featured_url(@admin_featured)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_featured_url(@admin_featured)
    assert_response :success
  end

  test "should update admin_featured" do
    patch admin_featured_url(@admin_featured), params: { admin_featured: { product_id: @admin_featured.product_id } }
    assert_redirected_to admin_featured_url(@admin_featured)
  end

  test "should destroy admin_featured" do
    assert_difference('Admin::Featured.count', -1) do
      delete admin_featured_url(@admin_featured)
    end

    assert_redirected_to admin_featureds_url
  end
end
