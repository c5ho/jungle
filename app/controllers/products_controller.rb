class ProductsController < ApplicationController

  include SalesHelper
  
  def index
    @products = Product.all.order(created_at: :desc)
  end
  
  def show
    if active_sale?
      @product = Product.find params[:id]
      @sale_price = @product.price * (1 - current_sale.percent_off.to_f/100)
    end
  end

end
