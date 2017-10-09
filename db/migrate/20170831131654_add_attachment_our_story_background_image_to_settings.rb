class AddAttachmentOurStoryBackgroundImageToSettings < ActiveRecord::Migration
  def self.up
    change_table :settings do |t|
      t.attachment :our_story_background_image
    end
  end

  def self.down
    remove_attachment :settings, :our_story_background_image
  end
end
