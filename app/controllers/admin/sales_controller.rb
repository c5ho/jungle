class Admin::SalesController < ApplicationController
  def index
    #render :index (implied)
    @sales = Sale.all.order(:starts_on)
    @current_sale = Sale.active.first
  end

  
end
