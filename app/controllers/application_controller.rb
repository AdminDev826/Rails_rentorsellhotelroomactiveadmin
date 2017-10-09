class ApplicationController < ActionController::Base
  
  # before_filter :set_locale
  before_filter :set_search_param
  before_filter :set_cookie

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  # def set_locale
  #   I18n.locale = params[:locale] if params[:locale].present?  
  # end

  # def default_url_options(options = {})
  #   {locale: I18n.locale}
  # end 
    
  protected

	  def configure_permitted_parameters
	  	devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :middle_name, :family_name, :email, :password, :password_confirmation, :image, :contact, :terms)}
	  	devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
	  	devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:first_name, :middle_name, :family_name, :email, :password, :remember_me, :image, :contact, :current_password)}
	  end
    
    def set_cookie
      cookies[:googtrans] = {
       :value => '',
       :expires => 1.year.from_now
     }
    end
    
    def set_search_param
      @search = Property.ransack(params[:q])
    end
end
