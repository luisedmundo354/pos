class SaleItem < ApplicationRecord
  belongs_to :product
  belongs_to :sale_order, inverse_of: :sale_items

end
