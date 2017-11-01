class AddCurrencyTypeToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :currency_type, :integer, :default => 0
  end
end
