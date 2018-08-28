class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.float :stock
      t.float :ss
      t.integer :deliver_time
      t.string :supplier
      t.integer :phone
      t.string :address
      t.string :level
      t.text :commentary

      t.timestamps
    end
  end
end
