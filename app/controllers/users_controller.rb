class UsersController < ApplicationController

	def index
		
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
			log_in @user
  			redirect_to @user
		else
			render 'new'
		end	
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.new
	end

	def update
		
	end
 	private
   	def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end