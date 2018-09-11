class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # protected
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname])
  #     devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname])
  #   end
end
