class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :listing_type
      t.string :location
      t.integer :bedrooms
      t.integer :bath
      t.boolean :furnished
      t.float :area
      t.integer :price
      t.date :availibility

      t.timestamps
    end
  end
end
