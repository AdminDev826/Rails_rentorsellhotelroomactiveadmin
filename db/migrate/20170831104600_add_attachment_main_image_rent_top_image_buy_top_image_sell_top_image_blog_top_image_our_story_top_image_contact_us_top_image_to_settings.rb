class AddAttachmentMainImageRentTopImageBuyTopImageSellTopImageBlogTopImageOurStoryTopImageContactUsTopImageToSettings < ActiveRecord::Migration
  def self.up
    change_table :settings do |t|
      t.attachment :main_image
      t.attachment :rent_top_image
      t.attachment :buy_top_image
      t.attachment :sell_top_image
      t.attachment :blog_top_image
      t.attachment :our_story_top_image
      t.attachment :contact_us_top_image
    end
  end

  def self.down
    remove_attachment :settings, :main_image
    remove_attachment :settings, :rent_top_image
    remove_attachment :settings, :buy_top_image
    remove_attachment :settings, :sell_top_image
    remove_attachment :settings, :blog_top_image
    remove_attachment :settings, :our_story_top_image
    remove_attachment :settings, :contact_us_top_image
  end
end
