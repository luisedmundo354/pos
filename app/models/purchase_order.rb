class PurchaseOrder < ApplicationRecord
  has_many :products, :through => :purchase_items
  has_many :purchase_items, :dependent => true
  belongs_to :replenisher
end
