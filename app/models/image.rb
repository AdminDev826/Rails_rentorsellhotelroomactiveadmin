class Image < ApplicationRecord

	belongs_to :property

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#", :original => {} }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :image, presence: true
end
