class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  
  validates :price_in_cents, numericality: { allow_nil: true, greater_than_or_equal_to: 0 }
  
  def marketplace_categories
    categories.map(&:name)
  end
end
