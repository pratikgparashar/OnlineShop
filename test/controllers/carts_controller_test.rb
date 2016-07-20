require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should destroy cart" do
	assert_difference('Cart.count', -1) do
	delete :destroy, :id => @cart.to_param
	end
	assert_redirected_to store_path
  end
end
