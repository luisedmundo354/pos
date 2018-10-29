class SaleItem < ApplicationRecord
  belongs_to :product
  belongs_to :sale_order, inverse_of: :sale_items
  after_create :decrement_stock
  after_destroy :increment_stock
  def decrement_stock
    if self.product.stock >= self.quantity
      self.product.update_attribute("stock", (product.stock - self.quantity))
    else
      errors.add(:product, message: "cannot be nil")
    end
  end
  def increment_stock
    self.product.update_attribute("stock", (product.stock + self.quantity))
  end
end
