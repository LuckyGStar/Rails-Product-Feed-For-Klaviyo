class AddParentIdToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :parent_id, :integer
  end
end
