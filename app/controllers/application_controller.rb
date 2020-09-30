class ApplicationController < ActionController::Base

	protected
  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def after_sign_up_path_for(resource)
      root_path(resource)
    end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end

	before_action :configure_permitted_parameters, if: :devise_controller?


	private
#sign_up時の登録情報追加
    def configure_permitted_parameters
	# devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profle_image, :email, :postal_code, :prefecture_code, :city, :building])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) # ログイン時はnameを使用
    end

end
