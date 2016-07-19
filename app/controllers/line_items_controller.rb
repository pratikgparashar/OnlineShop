class LineItemsController < ApplicationController
  before_action :set_line_item
	def new
    @line_item = LineItem.new
  end

 
  def create
  	@cart = current_cart
  	product = Product.find(params[:product_id])	
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        # flash[:success] = "Product added to cart"
        format.html { redirect_to root_path}
      	format.js { @current_item = @line_item }
      else

        flash[:notice]="Not added"

       format.html { redirect_to root_path }
      #render html: "Not Added"
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
      
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(current_cart), success: 'Line item was successfully removed' }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find_by(cart_id: current_cart)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end

