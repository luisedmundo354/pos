class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.float :stock
      t.float :ss
      t.integer :deliver_time
      t.string :level
      t.text :commentary
      t.belongs_to :category, index: true
      t.belongs_to :supplier, index: true
      t.timestamps
    end
  end
end
