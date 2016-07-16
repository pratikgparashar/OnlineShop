require 'test_helper'

class ProducsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producs_index_url
    assert_response :success
  end

  test "should get edit" do
    get producs_edit_url
    assert_response :success
  end

  test "should get show" do
    get producs_show_url
    assert_response :success
  end

  test "should get new" do
    get producs_new_url
    assert_response :success
  end

  test "should get _form" do
    get producs__form_url
    assert_response :success
  end

end
