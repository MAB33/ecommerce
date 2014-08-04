class Order < ActiveRecord::Base
  belongs_to :user
  has_one :card
  has_many :orders_products
  has_many :products, through: :orders_products

  def grand_total
  	my_array = []
  	self.orders_products.each do |op|
  		my_array << op.subtotal
  	end
  	result = 0
  	my_array.each do |price|
  		result = result + price
  	end
  	result
  end

  
end
