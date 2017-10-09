class ImagesController < ApplicationController
  def new
  	@image = Image.new
  end

  def create
  	@property = Property.find(params[:property_id])
  	@image = @property.images.build(image_params)
  	if @image.save
  		redirect_to property_path(@property), :notice => "Your Image is added Successfully. "
  	else
  		redirect_to property_path(@property), :notice => "Your Image is not added Successfully. "  		
  	end
  end

  def image_params
  	params.require(:image).permit(:image)
  end	
end
