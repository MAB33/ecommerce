class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.string :fname
      t.string :lname
      t.references :user, index: true

      t.timestamps
    end
  end
end
