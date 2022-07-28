class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"]

  def index
    render plain: "Everyone can see me!"
  end

  def show

  end
  
end
