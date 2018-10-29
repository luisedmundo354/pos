class PurchaseItem < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_order, inverse_of: :purchase_items
  after_destroy :decrement_stock
  after_create :increment_stock
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
