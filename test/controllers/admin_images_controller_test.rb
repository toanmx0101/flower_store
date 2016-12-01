require 'test_helper'

class AdminImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_image = admin_images(:one)
  end

  test "should get index" do
    get admin_images_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_image_url
    assert_response :success
  end

  test "should create admin_image" do
    assert_difference('AdminImage.count') do
      post admin_images_url, params: { admin_image: { link: @admin_image.link, product_id: @admin_image.product_id } }
    end

    assert_redirected_to admin_image_url(AdminImage.last)
  end

  test "should show admin_image" do
    get admin_image_url(@admin_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_image_url(@admin_image)
    assert_response :success
  end

  test "should update admin_image" do
    patch admin_image_url(@admin_image), params: { admin_image: { link: @admin_image.link, product_id: @admin_image.product_id } }
    assert_redirected_to admin_image_url(@admin_image)
  end

  test "should destroy admin_image" do
    assert_difference('AdminImage.count', -1) do
      delete admin_image_url(@admin_image)
    end

    assert_redirected_to admin_images_url
  end
end
