class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description, :price, :image_link, :categories

  def price
    object.price_in_cents / 100.0
  end

  def title
    object.name
  end
  
  def categories
    object.categories.map(&:display_name)
  end
end
