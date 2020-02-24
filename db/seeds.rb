# rubocop:disable Style/WordArray, Layout/AlignArray, Layout/MultilineArrayBraceLayout
Category.delete_all
Product.delete_all
ProductCategory.delete_all

categories = {
  "Accessories" => [
    "Belts", "Bags", "Gloves", "Hats & Headwear", "Keychains",
    "Patches & Pins", "Printed Shirts", "Magnets", "Scarves",
    "Socks", "Sunglasses", "Wallets"
  ],
  "Beauty" => ["Bath & Body", "Hair", "Makeup", "Fragrance", "Skincare", "Wellness"],
  "Food & Drink" => ["Coffee", "Tea", "Sodas & Juices", "Cocktail Mixers", "Sauces & Spreads", "Snacks", "Chocolate & Sweets"],
  "Home & Living" => ["Candles", "Fragrance", "Garden", "Organization", "Party", "Pillows & Bedding", "Tabletop", "Wall Decor"],
  "Kitchen" => ["Barware", "Cookware & Utensils", "Drinkware", "Dinnerware", "Linens"],
  "Jewelry" => ["Bracelets", "Earrings", "Necklaces", "Rings", "Watches"],
  "Baby & Kids" => ["Baby Accessories", "Baby Care", "Nursery", "Toys"],
  "Cards & Paper" => ["Anniversary Cards", "Baby Cards", "Birthday Cards",
    "Blank Cards", "Congratulations Cards", "Encouragement Cards", "Event Cards",
    "Funny Cards", "Holiday & Seasonal Cards", "Just Because Cards", "Thank You Cards",
    "Wedding Cards", "Notebooks", "Office Supplies", "Posters & Prints", "Stationery",
    "Stickers"
  ],
  "Pets" => ["Accessories", "Food", "Health", "Toys"]
}.freeze

categories.each do |parent, children|
  parent_tag = Category.where(parent_id: nil, name: parent, display_name: parent).last
  parent_tag ||= Category.create!(name: parent, display_name: parent)

  children.each do |child|
    Category.create!(name: child, display_name: child, parent_id: parent_tag.id)
  end
end

10.times do |index|
  Product.create!({
    name: "TSHIRT_#{index}",
    description: "Hot summer tshirt #{index}",
    price_in_cents: 1000,
    sku: "KLAVIYO-TSHIRT-#{index}",
    link: "https://helloabound.com/profiles/24998",
    image_link: "https://d37ccgxc0zy0si.cloudfront.net/brand_profiles/12923/images/lifestyle/large_1581015981",
    categories: [Category.last]
  })
end

10.times do |index|
  Product.create!({
    name: "CAP",
    description: "Autumn CAP",
    price_in_cents: 1000,
    sku: "KLAVIYO-TSHIRT-#{index}",
    link: "https://helloabound.com/profiles/24998",
    image_link: "https://d37ccgxc0zy0si.cloudfront.net/brand_profiles/12923/images/lifestyle/large_1581015981",
    categories: [Category.first]
  })
end
