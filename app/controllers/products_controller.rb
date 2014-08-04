class ProductsController < ApplicationController
  
  def index
  	@products = Product.all
  end

  def show
  	@user = User.find(session[:user_id])
    @product = Product.find(params[:id])
  end

end
