require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_index_url
    assert_response :success
  end

  test "should get edit" do
    get product_edit_url
    assert_response :success
  end

  test "should get show" do
    get product_show_url
    assert_response :success
  end

  test "should get new" do
    get product_new_url
    assert_response :success
  end

  test "should get _form" do
    get product__form_url
    assert_response :success
  end

end
