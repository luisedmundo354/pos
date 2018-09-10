class PurchaseOrder < ApplicationRecord
  has_many :purchase_items, inverse_of: :purchase_order, dependent: :destroy
  has_many :products, :through => :purchase_items
  belongs_to :replenisher
  #enable nested attributes
  accepts_nested_attributes_for :purchase_items, allow_destroy: true, :reject_if => :all_blank

end
