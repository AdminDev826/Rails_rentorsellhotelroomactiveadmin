class FavoritesController < ApplicationController
  def index
  	if user_signed_in?
	  	@user = current_user
	  	@properties = @user.favorites.pluck(:property_id)
	  	@properties = Kaminari.paginate_array(@properties).page(params[:page]).per(5)
	else
		redirect_to page_path('index'), notice: "You must be Signed in to Access this Page. "
	end	  	
  end
end
