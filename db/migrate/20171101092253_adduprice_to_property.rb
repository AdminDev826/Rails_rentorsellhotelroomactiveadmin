class AddupriceToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :uprice, :integer
  end
end
