class CartsController < ApplicationController
	before_action :set_cart
	# before_action = :set_user

	
	def new
    @cart = Cart.new
  end

  def create
  #   @cart = @user.carts.new
  # #  @cart.user_id = session[:user_id]
  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
     
  #     else
  #       format.html { render :new }
   
  #     end
  #   end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }

      else
        format.html { render :edit }
   
      end
    end
  end
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }

    end
  end
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      flash[:success] = "Invalid cart"
      redirect_to store_index_path
    else
        respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @cart }
        end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_path)}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # def set_user
    # 	@user=User.find_by_id(session[:user_id]) 
    # end	
end
