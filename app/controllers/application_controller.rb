class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception


	def validate_admin_user
		redirect_to root_path if !user_signed_in? || !current_user.is_admin
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :address, :email, :password, :password_confirmation) }
	end

	def after_sign_in_path_for(resource)
		root_path
  	end
end
