module SessionsHelper
	def log_in(user)

    session[:user_id] = user.id
    current_cart

  end
   # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

   def logged_in?
    !current_user.nil?
  end
  def log_out
      forget1(current_user)
      session.delete(:user_id)
      session.delete(:cart_id)	
      @current_user = nil
    end

     # Remembers a user in a persistent session.
  	def remember(user)
  	  user.remember
  	  cookies.permanent.signed[:user_id] = user.id
  	  cookies.permanent[:remember_token] = user.remember_token
  	end

  	 # Forgets a persistent session.
  def forget1(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
