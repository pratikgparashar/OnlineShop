class StoreController < ApplicationController
  def index
  	@products =Product.all
  	if logged_in?
  		@cart = current_cart
  	end	
  end
end

