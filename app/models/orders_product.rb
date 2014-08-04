class OrdersProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

    def subtotal
		self.quantity * self.product.price
	end

end
