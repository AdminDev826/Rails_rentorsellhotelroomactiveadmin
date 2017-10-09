class ChangeDatatypeOfSomeFieldsOfSettings < ActiveRecord::Migration[5.0]
  def change
    change_column :settings, :accuracy_of_info_text, :text
    change_column :settings, :about_us_welcome_msg, :text
  end
end
