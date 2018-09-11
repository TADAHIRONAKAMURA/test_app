class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

	
	protected
    def configure_permitted_parameters
    	 # :password, :password_confirmation, :acceptedを追加した。
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname, :password, :password_confirmation, :accepted,:registration_check])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname])
    end
end

