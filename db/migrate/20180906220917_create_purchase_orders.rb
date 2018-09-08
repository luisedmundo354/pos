class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.integer :number
      t.text :comment
      t.belongs_to :replenisher, index: true
      t.timestamps
    end
  end
end
