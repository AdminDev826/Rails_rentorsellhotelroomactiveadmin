class Property < ApplicationRecord

	belongs_to :user
	has_many   :images
	accepts_nested_attributes_for :images, allow_destroy: true

	has_many   :favorites
	# has_many   :users, through: :favorites

	has_attached_file :image, styles: { large: "750x441>", medium: "600x600>", thumb: "100x100#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	scope :published, ->{ where(isPublished: 1) }
	scope :unpublished, ->{ where(isPublished: 0) }
	scope :featured, ->{ where(isFeatured: 1) }
	scope :not_featured, ->{ where(isFeatured: 0) }
	scope :rent, ->{ where(tag: "Rent") }
	scope :buy, ->{ where(tag: "Buy") }
	scope :sell, ->{ where(tag: "Sell") }

	validates :title, presence: true
	validates :address, presence: true
	validates :listing_type, presence: true
	validates :location, presence: true
	validates :bedrooms, presence: true
	validates :bath, presence: true
	validates :tag, presence: true
	validates :area, presence: true
	validates :price, presence: true
	validates :availibility, presence: true
	validates :image, presence: true
	validates :address, length: { minimum: 10 }
	validates :description, length: { minimum: 15 }
	validates :description, presence: true
	validate :empty_land_option_for_sell_tag

	def empty_land_option_for_sell_tag
		if self.listing_type == "Empty Land" && self.tag != "Sell"
			errors.add(:tag, "can't be rent for Empty Land type property. ")
		end
	end

	def to_param
		"#{id} #{title}".parameterize
	end

	def self.search(search)
		if(search)
			where(["title LIKE ? AND isPublished = ?","%#{search}%", "1"])
		else
			order(:id => :DESC).where(isPublished: 1)
		end	
	end

end
