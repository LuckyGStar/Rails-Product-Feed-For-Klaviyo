class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :link
      t.string :description
      t.string :image_link
      t.integer :price_in_cents
      
      t.timestamps
    end
  end
end
