class AddPropertIdToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :property_id, :integer
  end
end
