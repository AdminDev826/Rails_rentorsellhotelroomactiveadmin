class AddUserIdToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :user_id, :integer
  end
end
