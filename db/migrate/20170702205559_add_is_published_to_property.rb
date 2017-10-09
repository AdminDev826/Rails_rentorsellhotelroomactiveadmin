class AddIsPublishedToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :isPublished, :integer, :default => 0
  end
end
