class AddUpcToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :upc, :bigint
  end
end
