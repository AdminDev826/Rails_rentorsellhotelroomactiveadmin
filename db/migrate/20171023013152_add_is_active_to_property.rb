class AddIsActiveToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :isActive, :integer, :default => 0
  end
end
