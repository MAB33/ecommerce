module OrdersHelper

	def current_order
		session[:order_id].nil? ? nil :Order.find(session[:order_id])
	end

	def auth_order
		@order.id == current_order.id
	end

	def find_quantity(product)
		op = OrdersProduct.find_by(order_id: current_order.id, product_id: product.id)
		op.quantity
	end

end
