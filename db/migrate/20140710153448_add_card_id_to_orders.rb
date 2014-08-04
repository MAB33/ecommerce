class AddCardIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :card_id, :integer
  end
end
