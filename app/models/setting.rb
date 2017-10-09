class Setting < ApplicationRecord
  has_attached_file :main_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :rent_top_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :rent_top_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :sell_top_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :sell_top_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :blog_top_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :blog_top_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :contact_us_top_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :contact_us_top_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :our_story_top_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :our_story_top_image, content_type: /\Aimage\/.*\z/
  
  has_attached_file :our_story_background_image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :our_story_background_image, content_type: /\Aimage\/.*\z/
end
