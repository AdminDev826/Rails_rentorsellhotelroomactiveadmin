class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :phone
      t.string :email
      t.string :welcome_msg
      t.string :fb_link
      t.string :twitter_link
      t.string :instagram_link
      t.string :youtube_link
      t.string :about_us_welcome_msg
      t.text :about_us_text
      t.text :terms_of_services_text
      t.string :accuracy_of_info_text
      t.text :membership_and_account_reg_text
      t.text :general_ownership_of_account_text
      t.text :changes_to_the_terms_of_service_text
      t.text :avoid_scams_text
      t.text :tips_avoid_scams_text

      t.timestamps
    end
  end
end
