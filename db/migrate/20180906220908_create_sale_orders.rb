class CreateSaleOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_orders do |t|
      t.integer :number
      t.text :comment
      t.belongs_to :customer, index: true
      t.timestamps
    end
  end
end
