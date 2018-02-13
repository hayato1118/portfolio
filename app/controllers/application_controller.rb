class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource)
	  products_path
	end

	def after_sign_out_path_for(resource)
	  products_path
	end

 #  protected

 # def configure_permitted_parameters
 #    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
 #    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :profile_image_id, :mobile, :last_name,:last_name_kana,:first_name,:first_name_kana,:nickname,:nickname, :github_id,:phone_number1,:phone_number2,:phone_number3,:introduction])
 #  end
end

