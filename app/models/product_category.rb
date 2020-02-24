class ProductCategory < ApplicationRecord
  belongs_to :category, touch: true
  belongs_to :product
end
