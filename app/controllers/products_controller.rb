class ProductsController < ApplicationController

  include SalesHelper
  
  def index
    if active_sale?
      @products = Product.all.order(created_at: :desc)
    end
  end

  def show
    @product = Product.find params[:id]
  end

end
