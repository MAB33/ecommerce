class ChangeCreditCardNumColumnToBigintTake2 < ActiveRecord::Migration
  def self.up    
    change_column(:cards, :card_number, :bigint)  
  end
end
