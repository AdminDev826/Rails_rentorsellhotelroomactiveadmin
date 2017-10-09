class AddDescriptionToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :description, :text
  end
end
