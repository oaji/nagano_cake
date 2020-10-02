class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?



	protected
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
     root_path
  end

  def after_destroy_session_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end




	private
#sign_up時の登録情報追加
    def configure_permitted_parameters
	# devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profle_image, :email, :postal_code, :prefecture_code, :city, :building])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) # ログイン時はnameを使用
    end
end
