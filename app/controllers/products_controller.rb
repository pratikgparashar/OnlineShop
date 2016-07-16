class ProductsController < ApplicationController
  def index
    @product = Product.all
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
      render html: "Product Saved"
    else
      render products_new_path
    end  
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy  
    redirect_to products_path
  end

  def product_params
    params.require(:product).permit(:title,:description,:image_url,:price)
  end
end
