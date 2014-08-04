class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.references :order, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
