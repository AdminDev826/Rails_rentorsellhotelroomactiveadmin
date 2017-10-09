class Blog < ApplicationRecord
  has_attached_file :image, 
  styles: { medium: "300x300>", thumb: "100x100>" }, 
  default_url: ActionController::Base.helpers.asset_path("images/blog-img1.jpg")
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  validates :title, presence: true
  validates :image, presence: true
  validates :description, length: { minimum: 15 }
end
