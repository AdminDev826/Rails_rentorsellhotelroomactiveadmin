ActiveAdmin.register Setting do

  permit_params :phone, :email, :welcome_msg, :fb_link, :twitter_link, :instagram_link, 
                :youtube_link, :about_us_welcome_msg, :about_us_text, :terms_of_services_text, 
                :accuracy_of_info_text, :membership_and_account_reg_text, 
                :general_ownership_of_account_text, :changes_to_the_terms_of_service_text, 
                :avoid_scams_text, :tips_avoid_scams_text, :main_image, :rent_top_image, 
                :sell_top_image, :blog_top_image, :our_story_top_image, :contact_us_top_image, 
                :our_story_background_image


  show do
    attributes_table do
      row :phone
      row :email
      row :welcome_msg  do |setting|
        raw(setting.welcome_msg)
      end
      row :fb_link
      row :instagram_link
      row :twitter_link
      row :youtube_link
      row :about_us_welcome_msg do |setting|
        raw(setting.about_us_welcome_msg)
      end
      row :about_us_text do |setting|
        raw(setting.about_us_text)
      end
      row :terms_of_services_text do |setting|
        raw(setting.terms_of_services_text)
      end
      row :accuracy_of_info_text do |setting|
        raw(setting.accuracy_of_info_text)
      end
      row :membership_and_account_reg_text do |setting|
        raw(setting.membership_and_account_reg_text)
      end
      row :general_ownership_of_account_text do |setting|
        raw(setting.general_ownership_of_account_text)
      end
      row :changes_to_the_terms_of_service_text do |setting|
        raw(setting.changes_to_the_terms_of_service_text)
      end
      row :avoid_scams_text do |setting|
        raw(setting.avoid_scams_text)
      end
      row :tips_avoid_scams_text do |setting|
        raw(setting.tips_avoid_scams_text)
      end
      row :main_image do
        image_tag setting.main_image.url(:medium)
      end
      row :rent_top_image do
        image_tag setting.rent_top_image.url(:medium)
      end
      row :sell_top_image do
        image_tag setting.sell_top_image.url(:medium)
      end
      row :our_story_top_image do
        image_tag setting.our_story_top_image.url(:medium)
      end
      row :contact_us_top_image do
        image_tag setting.contact_us_top_image.url(:medium)
      end
      row :blog_top_image do
        image_tag setting.blog_top_image.url(:medium)
      end
      row :our_story_background_image do
        image_tag setting.our_story_background_image.url(:medium)
      end
    end
    
    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs "Settings" do
      f.input :phone
      f.input :email
      f.input :welcome_msg, as: :ckeditor
      f.input :fb_link
      f.input :twitter_link
      f.input :instagram_link
      f.input :youtube_link
      f.input :about_us_welcome_msg, as: :ckeditor
      f.input :about_us_text, as: :ckeditor
      f.input :terms_of_services_text, as: :ckeditor
      f.input :accuracy_of_info_text, as: :ckeditor
      f.input :membership_and_account_reg_text, as: :ckeditor
      f.input :general_ownership_of_account_text, as: :ckeditor
      f.input :changes_to_the_terms_of_service_text, as: :ckeditor
      f.input :avoid_scams_text, as: :ckeditor
      f.input :tips_avoid_scams_text, as: :ckeditor
      
      f.input :main_image, :as => :file, :hint => f.object.main_image.present? \
      ? image_tag(f.object.main_image.url(:large))
      : content_tag(:span, "No Home Page Main Image Yet")
      
      f.input :rent_top_image, :as => :file, :hint => f.object.rent_top_image.present? \
      ? image_tag(f.object.rent_top_image.url(:large))
      : content_tag(:span, "No Home Page Main Image Yet")
      
      f.input :sell_top_image, :as => :file, :hint => f.object.sell_top_image.present? \
      ? image_tag(f.object.sell_top_image.url(:large))
      : content_tag(:span, "No Sell Page Top image yet")
      
      f.input :our_story_top_image, :as => :file, :hint => f.object.our_story_top_image.present? \
      ? image_tag(f.object.our_story_top_image.url(:large))
      : content_tag(:span, "No Our Story Top Page Image Yet")
      
      f.input :contact_us_top_image, :as => :file, :hint => f.object.contact_us_top_image.present? \
      ? image_tag(f.object.contact_us_top_image.url(:large))
      : content_tag(:span, "No Contact US Page Top Image Yet")
      
      f.input :blog_top_image, :as => :file, :hint => f.object.blog_top_image.present? \
      ? image_tag(f.object.blog_top_image.url(:large))
      : content_tag(:span, "No Blog Page Top Image Yet")
      
      f.input :our_story_background_image, :as => :file, :hint => f.object.our_story_background_image.present? \
      ? image_tag(f.object.our_story_background_image.url(:large))
      : content_tag(:span, "No Our Story Page Background Image Yet")
    end
    f.actions
  end
  
  index do
    selectable_column
    column :phone
    column :email
    column :welcome_msg do |setting|
      raw(setting.welcome_msg)
    end
    column :fb_link
    column :twitter_link
    column :instagram_link
    column :youtube_link
    column :about_us_welcome_msg  do |setting|
      raw(setting.about_us_welcome_msg)
    end
    column :about_us_text  do |setting|
      raw(setting.about_us_text)
    end
    column :terms_of_services_text  do |setting|
      raw(setting.terms_of_services_text)
    end
    column :accuracy_of_info_text  do |setting|
      raw(setting.accuracy_of_info_text)
    end
    column :membership_and_account_reg_text  do |setting|
      raw(setting.membership_and_account_reg_text)
    end
    column :general_ownership_of_account_text  do |setting|
      raw(setting.general_ownership_of_account_text)
    end
    column :changes_to_the_terms_of_service_text  do |setting|
      raw(setting.changes_to_the_terms_of_service_text)
    end
    column :avoid_scams_text  do |setting|
      raw(setting.avoid_scams_text)
    end
    column :tips_avoid_scams_text  do |setting|
      raw(setting.tips_avoid_scams_text)
    end
    
    column "Main Home Page Image" do |image|
      image_tag image.main_image.url(:thumb)
    end
    
    column "Rent & Buy Page Top Image" do |image|
      image_tag image.rent_top_image.url(:thumb)
    end
    
    column "Sell Page Top Image" do |image|
      image_tag image.main_image.url(:thumb)
    end
    
    column "Our Story Page Top Image" do |image|
      image_tag image.rent_top_image.url(:thumb)
    end
    column "Contact Us Page Top Image" do |image|
      image_tag image.main_image.url(:thumb)
    end
    column "Blog Page Top Image" do |image|
      image_tag image.blog_top_image.url(:thumb)
    end
    column "Our Story Background Image" do |image|
      image_tag image.our_story_background_image.url(:thumb)
    end
    actions
  end

end
