class Admin::SalesController < ApplicationController
  def index
    #render :index (implied)
    @sales = Sale.all.order(:starts_on)
  end
  
end
