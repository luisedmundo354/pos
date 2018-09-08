class Customer < ApplicationRecord
  has_many :sale_orders
end
