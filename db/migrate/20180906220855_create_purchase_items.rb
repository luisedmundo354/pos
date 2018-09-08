class CreatePurchaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_items do |t|
      t.float :price
      t.integer :quantity
      t.belongs_to :product
      t.belongs_to :purchase_order
      t.timestamps
    end
  end
end
