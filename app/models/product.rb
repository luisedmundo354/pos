class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :purchase_items
  has_many :purchase_orders, :through => :purchase_items
  has_many :sale_items
  has_many :sale_orders, :through => :sale_items
  before_save :calculate_level

def calculate_level
  if self.stock <= self.ss
    self.level = 'Reponer'
  elsif self.stock <= 2*self.ss
    self.level = 'Bajo'
  elsif self.stock <= 3*self.ss
    self.level = 'Medio'
  else
    self.level = 'Alto'
  end
end

end
