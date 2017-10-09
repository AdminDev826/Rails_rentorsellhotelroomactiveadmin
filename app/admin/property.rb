WtfLang::API.key = "fa9d6d9faf06420ada0090796f8c778d"

ActiveAdmin.register Property do

	permit_params :title, :listing_type, :location, :isPublished, :isFeatured, :bedrooms,
                :bath, :furnished, :area, :price, :availibility, :image, :address, :user_id,
                :near_by_location, :description, :tag, :longitude, :latitude, 
                images_attributes: [:id, :property_id, :image, :_destroy]
                
	scope :all
	scope :rent
	scope :buy
	scope :sell
	scope :published
	scope :unpublished
	scope :featured
	scope :not_featured
  
  # batch_action :isFeatured do |selection|
  #   Property.find(selection).each { |property| property.update(isFeatured: 1) }
  #   redirect_to collection_path, notice: "The properties have been featured."
  # end

	action_item :Publish, only: :show do 
		link_to "Publish", Publish_admin_property_path(property), method: :put if !property.isPublished?
	end	

	action_item :UnPublish, only: :show do 
		link_to "UnPublish", UnPublish_admin_property_path(property), method: :put if property.isPublished?
	end

	action_item :Featured, only: :show do 
		link_to "Featured", Featured_admin_property_path(property), method: :put if !property.isFeatured?
	end	

	action_item :UnFeatured, only: :show do 
		link_to "UnFeatured", UnFeatured_admin_property_path(property), method: :put if property.isFeatured?
	end	

	member_action :Publish, method: :put do
		property = Property.find(params[:id])
		property.update(isPublished: 1)
		redirect_to admin_property_path(property)
	end	

	member_action :UnPublish, method: :put do
		property = Property.find(params[:id])
		property.update(isPublished: 0)
		redirect_to admin_property_path(property)
	end

	member_action :Featured, method: :put do
		property = Property.find(params[:id])
		property.update(isFeatured: 1)
		redirect_to admin_property_path(property)
	end	

	member_action :UnFeatured, method: :put do
		property = Property.find(params[:id])
		property.update(isFeatured: 0)
		redirect_to admin_property_path(property)
	end	
	
	index do
    selectable_column
    column :user do |property|
      property.user.first_name
    end
    column "Image" do |image|
        image_tag image.image.url(:thumb)
    end
    Property.column_names.each do |c|
      column c.to_sym
    end
    actions
  end
  
  show do
    attributes_table do
      row :user
      row :title
      row :listing_type
      row :location
      row :address
      row :bedrooms
      row :bath
      row :furnished
      row :area
      row :price
      if property.description.full_lang == 'arabic'
        row :description, dir: 'rtl'
      else
        row :description
      end
      row :availibility
      row :image do
        image_tag property.image.url(:medium)
      end
      row :longitude
      row :latitude
      row :isPublished
      row :isFeatured
      row :tag
      row "Images" do
        ul do
          property.images.each do |img|
            li do 
              image_tag(img.image.url(:large))
            end
          end
        end
      end
    end
    
    active_admin_comments
  end

  form multipart: true do |f|
    f.inputs "Property Details" do
    	f.input :user_id, as: :select, collection: User.all.map{|x| [x.email, x.id]}
      f.input :title
      f.input :listing_type, as: :select, collection: ['Apartment', 'House', 'Villa', 'Office', 'Farm House', 'Empty Land'], include_blank: false
      f.input :location, as: :select, collection: ['Khartoum', 'Bahri, Khartoum/North', 'Umdurman'], include_blank: false
      f.input :address
      f.input :bedrooms
      f.input :bath
      f.input :furnished
      f.input :area
      f.input :price
      if f.object.new_record?
        f.input :description
      else
        if f.object.description.full_lang == 'arabic'
          f.input :description, input_html: { dir: 'rtl' }
        else
          f.input :description
        end
      end
      f.input :availibility
      f.input :image, :as => :file, :hint => f.object.image.present? \
      ? image_tag(f.object.image.url(:medium))
      : content_tag(:span, "no image yet") 
      f.input :longitude
      f.input :latitude
      f.input :isPublished
      f.input :isFeatured
      f.input :tag, as: :select, collection: ['Rent', 'Sell'], include_blank: false
      f.inputs "Images" do
        f.has_many :images, allow_destroy: true do |p|
          p.input :image, :hint => p.object.image.present? \
      ? image_tag(p.object.image.url(:medium))
      : content_tag(:span, "no image yet")
        end
      end
    end
    f.button :Submit
  end
  
  filter :user_id, as: :select, collection: User.all.map{|x| [x.email, x.id]}
  filter :title
  filter :address
  filter :location
  filter :tag, as: :select, collection: ['Rent', 'Sell']
  filter :listing_type, as: :select, collection: ['Apartment', 'House', 'Villa', 'Office', 'Farm House', 'Empty Land']
  filter :bedrooms
  filter :bath
  filter :furnished
  filter :area
  filter :price
  filter :description
  filter :availibility
  filter :image
  filter :isPublished, as: :select, collection: ['1', '0']
  filter :isFeatured, as: :select, collection: ['1', '0']
end
