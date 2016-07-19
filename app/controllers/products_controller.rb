class ProductsController < ApplicationController
  def index
    if current_user.id==1
      @product = Product.all
    else
      redirect_to root_path
    end
  end  
  def edit
    @product=Product.find(params[:id])
  end

  def show
    @product=Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product Saved Successfully"
      redirect_to new_product_path
    else
      render new_product_path
    end  
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy  
    redirect_to products_path
  end
  def update
    @product=Product.find(params[:id])
    @product.update_attributes(product_params)
  end  

  def product_params
    params.require(:product).permit(:title,:description,:image_url,:price)
  end
  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
    format.atom
    format.xml { render :xml => @product }
    end
  end
end
