class AddAttachmentImageToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :blogs, :image
  end
end
