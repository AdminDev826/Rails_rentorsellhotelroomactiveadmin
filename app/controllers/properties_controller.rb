class PropertiesController < ApplicationController
  def index
    if params[:q].present? && @search.result
      @search_properties = @search.result
      @properties = @search_properties.where(isPublished: 1)
      @count = @properties.count
      @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    else
      @properties = Property.where(:isPublished => 1).all
      @count = @properties.count
      @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    end  
  end

  def mark_favorite
    @favorite  = Favorite.new(:property_id => params[:id])
    @favorite.user_id = current_user.id
    if @favorite.save
      redirect_to property_path(@favorite.property_id), :notice => "You have marked this property as Favorite. "
    else
      redirect_to property_path(@favorite.property_id), :notice => "Your Property is not Marked as Favorite. "
    end 
  end

  def search
    @search_properties = @search.result
    @properties = @search_properties.where(:isPublished => 1)
    @count = @properties.count
    @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    
    render 'index'
  end
  
  def tag_search
    @search_properties = @search.result
    @properties = @search_properties.where(:isPublished => 1)
    @count = @properties.count
    @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    
    render "index"
  end
  
  def neighbour_hood_locations
    @properties = Property.near(params[:neighbourhoods], 2)
    @count = @properties.count
    @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    
    render "index"
  end

  def new
  	if user_signed_in?
  		@property = Property.new
  	else
  		redirect_to page_path('index'), :notice => "You must be Logged in to Submit Property "
  	end		
  end

  def create
  	@user = current_user
  	@property =  @user.properties.build(property_params)
  	if @property.save
  		redirect_to property_path(@property), :notice => "Your Property has been Saved. "
  	else
  		render :new
  	end 
  end	

  def edit
  	@property = Property.find(params[:id])
  	authorize! :update, @property 
  end

  def update
  	@property = Property.find(params[:id])
  	authorize! :update, @property

    if @property.update_attributes(property_params)
  	  redirect_to property_path, :notice => "Your Property has been Updated. "
    else 
  	  render "edit"
  	end
  end	

  def show
    @search = Property.ransack(params[:q])  
  	@property = Property.find(params[:id])
    @locations = Property.distinct.pluck(:location)
  end

  def destroy
  	@property = Property.find(params[:id])
  	authorize! :destroy, @property
  	@property.destroy
  	redirect_to properties_path, :notice => "Your Property has been Deleted. "
  end	
  
  def contact_form
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @subject = params[:subject]
    @message = params[:message]
    
    if ContactMailer.contact(@name, @email, @phone, @subject, @message).deliver
      redirect_to page_path('contact'), notice: 'Thank you for contacting us.'
    else
      redirect_to page_path('contact'), notice: 'Some problem Occured, try again later.'
    end
  end
  
  def newsletter
    @email = params[:email]
    @newsletter = Newsletter.create(email: @email)
    
    respond_to do |format|
      if @newsletter.save
       format.html { redirect_to page_path('index'), notice: 'Thank you for Subscribing.' }
       format.js
      else
       format.html { redirect_to page_path('index'), notice: 'Some problem Occured, try again later.' }
       format.js
      end
    end
  end
  
  def rent
    @properties = Property.where(isPublished: 1)
    @properties = @properties.where(tag: 'Rent')
    @count = @properties.count
    @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    
    render 'index'
  end
  
  def buy
    @properties = Property.where(isPublished: 1)
    @properties = @properties.where(tag: 'Sell')
    @count = @properties.count
    @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
    
    render 'index'
  end

  def property_params
	params.require(:property).permit!
  end
end
