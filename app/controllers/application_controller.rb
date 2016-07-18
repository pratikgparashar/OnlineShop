class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private
    def current_cart
      cart = current_user.carts.first_or_create if current_user 
      
      session[:cart_id] = cart.id
      cart
    end

    def current_user
        User.find_by_id(session[:user_id])
    end
end
