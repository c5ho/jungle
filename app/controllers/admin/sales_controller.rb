class Admin::SalesController < ApplicationController
  def index
    #render :index (implied)
    @sales = Sale.all
  end
end
