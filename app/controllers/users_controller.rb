class UsersController < ApplicationController
  before_action :correct_user, :only => [:create,:show,:edit]

  
	def index
		if current_user.id == 1
		@cart =current_cart
		@users = User.paginate :page=>params[:page],
  		:per_page => 10
  		else
  		redirect_to root_path
  		end	
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
		@user = User.find(params[:id])
	end

	def update
		
	end
 	private
   	def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def correct_user
       @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
      
    end
end
