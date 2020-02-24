class Category < ApplicationRecord
  has_many :products, through: :product_categories
  has_many :subcategories, class_name: Category.name, foreign_key: :parent_id, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :parent_id, case_sensitive: false }
end