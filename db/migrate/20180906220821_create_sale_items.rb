class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.float :price
      t.integer :quantity
      t.belongs_to :product
      t.belongs_to :sale_order
      t.timestamps
    end
  end
end
