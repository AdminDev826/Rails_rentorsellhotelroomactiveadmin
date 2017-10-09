class ChangeDatatypeOfWelcomeMsgOfSettings < ActiveRecord::Migration[5.0]
  def change
    change_column :settings, :welcome_msg, :text
  end
end
