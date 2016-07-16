class LineItemsController < ApplicationController
	def new
    @line_item = LineItem.new
  end

 
  def create
  	@cart = current_cart
  	product = Product.find(params[:product_id])	
    @line_item = @cart.line_items.build(:product => product)	

    #respond_to do |format|
      if @line_item.save
        #format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
      	flash.now[:success]="Item has been added to cart"
      	redirect_to root_path
      else
      #  format.html { render :new }
      render html: "Not Added"
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
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
   
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end

