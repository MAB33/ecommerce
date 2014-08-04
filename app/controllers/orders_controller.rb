class OrdersController < ApplicationController
	
	def index
		@user = User.find(session[:user_id])
		@orders = Order.all
		@orders_products = OrdersProduct.all
	end

	def show
		@order = Order.find(session[:order_id])
	end

	def addToCart
		@user = User.find(session[:user_id])
		if session[:order_id] != nil
			@order = Order.find(session[:order_id])
		else
		    @order = Order.create(user_id: @user.id, purchased: false)
		    session[:order_id] = @order.id
	   	end
	   	if @order
			product = Product.find(params[:product_id])
			quantity = (params[:quantity])
			@orders_products = OrdersProduct.create(order_id: @order.id, product_id: product.id, quantity: quantity)
			if @orders_products
				flash[:notice] = "Your order has been placed."
			   	redirect_to products_path
			else
				render 'product/index'
			end
	   	end
	end

	def orderComplete
		@order = Order.find(session[:order_id])
		if @order
		@order.update(purchased: true)
		session[:order_id] = nil
		redirect_to products_path, notice: "Order Complete!"
		end
	end

end
