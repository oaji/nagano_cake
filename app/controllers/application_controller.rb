class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
    admin_admins_top_path
    when Customer
    root_path
   end
  end

  def after_sign_out_path_for(resource_or_scope)
     if resource_or_scope == :admin
      admins_sign_in_path
      else
      root_path
     end
  end


	private
    def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :first_name_kana,:family_name_kana, :post_code, :address, :telephone,:email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) # ログイン時はnameを使用
    end
end