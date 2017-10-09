class AddTagToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :tag, :string
  end
end
