class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :phone
      t.string :address
      t.timestamps
    end
  end
end
