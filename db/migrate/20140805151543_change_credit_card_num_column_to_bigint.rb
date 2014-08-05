class ChangeCreditCardNumColumnToBigint < ActiveRecord::Migration
  def change
  	change_column :cards, :card_number, :bigint
  end
end
