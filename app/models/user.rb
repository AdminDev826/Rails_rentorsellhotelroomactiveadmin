class User < ApplicationRecord

  has_many :properties, :dependent => :destroy

 	has_many   :favorites
	# has_many   :properties, through: :favorites, :dependent => :destroy
		
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :confirmable,
	     :recoverable, :rememberable, :trackable, :validatable

	validates_confirmation_of :password         

	has_attached_file :image, 
	styles: { large: "750x441>", medium: "300x300>", thumb: "100x100#" }, 
	default_url: ActionController::Base.helpers.asset_path("logo4.png")
	
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	validates :first_name, presence: true
	validates :middle_name, presence: true
	validates :family_name, presence: true
	validates :contact, presence: true
	validates :terms, acceptance: true
end
