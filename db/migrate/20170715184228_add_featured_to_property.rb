class AddFeaturedToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :isFeatured, :integer, :default => 0
  end
end
