class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_i18n_locale_from_params
  # ...
  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
          "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      { :locale => I18n.locale }
    end
    include SessionsHelper
    private
      def current_cart
        
        cart = current_user.carts.first_or_create if current_user   
             
        session[:cart_id] = cart.id
        @cart = cart
        
        return @cart
       
      end

      def assign_new_cart
        cart =current_user.carts.create
        session[:cart_id]=cart.id
        return @cart      
      end


      def current_user
          User.find_by_id(session[:user_id])
      end
end
