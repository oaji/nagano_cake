class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception

  	helper_method :current_cart

  	def current_cart
  		if session[:customer_id]
  			@cart_item = CartItem.find(session[:customer_id])
  		else
  			@cart_item = CartItem.create
  			session[:customer_id] = @cart_item.id
  		end
  	end



	protected
  def after_sign_in_path_for(resource)
    root_path
  end


	private
    def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :first_name_kana,:family_name_kana, :post_code, :address, :telephone,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) # ログイン時はnameを使用
    end
end
