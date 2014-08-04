class User < ActiveRecord::Base
	has_many :orders
	has_many :orders_products
	has_many :cards, :dependent => :destroy

	validates_presence_of :username, :password, :password_confirmation
	validates :username, uniqueness: true
	validates :password, confirmation: true
	validates :password_confirmation, confirmation: true
end
