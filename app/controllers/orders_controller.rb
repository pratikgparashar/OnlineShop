class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  # GET /orders
  # GET /orders.json
  def index
    #@orders = Order.all
    if !current_user.nil?
      if current_user.admin 
        @orders = Order.paginate :page=>params[:page],
        :per_page => 10
      else
        redirect_to root_path
      end
    else 
      redirect_to root_path
    end  

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = current_user.orders
  end

  # GET /orders/new
  def new
    if current_cart.line_items.empty?
      redirect_to root_path, :notice => "Your cart is empty"
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(order_params)
    @order.add_line_items_from_cart(current_cart)
     respond_to do |format|
      if @order.save

        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:success]="'Thank you for your order.'"
        assign_new_cart
        #NotifierMailer.order_received(@order).deliver
        format.html { redirect_to(root_path) }
   
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find_by_id(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id,:name, :address, :email, :pay_type)
    end
end
