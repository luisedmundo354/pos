class SaleOrder < ApplicationRecord
  has_many :sale_items, inverse_of: :sale_order, dependent: :destroy
  has_many :products, :through => :sale_items
  belongs_to :customer
  #enable nested attributes
  accepts_nested_attributes_for :sale_items, allow_destroy: true, :reject_if => :all_blank
  #Validations
  validates_associated :products
  validate do |sale_order|
    sale_order.sale_items.each do |sale_item|
      sale_item.errors.full_messages.each do |msg|
        # you can customize the error message here:
        errors.add("Sale items Error: #{msg}")
      end
    end
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
    csv << column_names
    all.each do |sale_order|
      csv << sale_order.attributes.merge(sale_order.customer.attributes).values_at(*column_names)
    end
  end
end

end
