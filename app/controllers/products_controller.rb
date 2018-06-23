class ProductsController < ApplicationController

  def create
    product = Product.new(product_params)
    product.category_id = params[:category_id]
    product.save
    redirect_to product.category
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to @product.category
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
