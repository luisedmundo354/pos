class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  before_save :calculate_level

def calculate_level
  if self.stock <= self.ss
    self.level = 'Reponer'
  elsif self.stock <= 1.5*self.ss
    self.level = 'Bajo'
  elsif self.stock <= 2.5*self.ss
    self.level = 'Medio'
  else
    self.level = 'Alto'
  end
end

end
