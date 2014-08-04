class Card < ActiveRecord::Base
  belongs_to :user

  CARDTYPE = ['American Express', 'Mastercard', 'Visa']

  	validates_presence_of :card_type, :card_number, :fname, :lname, :user_id 
	validates :card_number, uniqueness: true
	validates_length_of :card_number, :is => 16, :message => "- You must enter a valid 16 digit Card number."

	before_save :capitalize_name

	def capitalize_name
		self.fname = self.fname.capitalize
		self.lname = self.lname.capitalize
	end	

end
