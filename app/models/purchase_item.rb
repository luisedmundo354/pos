class PurchaseItem < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_order, inverse_of: :purchase_items
end
