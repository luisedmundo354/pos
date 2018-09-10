class SaleOrder < ApplicationRecord
  has_many :sale_items, inverse_of: :sale_order, dependent: :destroy
  has_many :products, :through => :sale_items
  belongs_to :customer
  #enable nested attributes
  accepts_nested_attributes_for :sale_items, allow_destroy: true, :reject_if => :all_blank
end
