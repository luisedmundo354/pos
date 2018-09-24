class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :purchase_items
  has_many :purchase_orders, :through => :purchase_items
  has_many :sale_items
  has_many :sale_orders, :through => :sale_items
  before_save :calculate_level

  filterrific(
    default_filter_params: { sorted_by: 'name_desc' },
    available_filters: [
        :sorted_by,
        :search_query,
        :with_category_id,
        :with_level
      ]
    )

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(products.name) LIKE ? OR LOWER(products.brand) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  scope :with_category_id, lambda { |category_ids|
    where(category_id: [*category_ids])
  }

  scope :with_level, lambda { |levels|
    where(level: [*levels])
  }

  scope :sorted_by, lambda { |sort_options|
  direction = (sort_options =~ /desc$/) ? 'desc' : 'asc'

    case sort_options.to_s
    when /^name_/
      order("products.name #{ direction }")

    else
      raise(ArgumentError, "Invalid sort option")
    end
  }

  def self.options_for_sorted_by
    [
      ['Name (AZ)', 'name_asc'],
      ['Name (ZA)', 'name_desc']
     ]
  end

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
