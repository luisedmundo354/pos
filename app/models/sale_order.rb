class SaleOrder < ApplicationRecord
  has_many :products, :through => :sale_items
  has_many :sale_items, inverse_of: :sale_order
  belongs_to :customer
  #enable nested attributes
  accepts_nested_attributes_for :sale_items

end
