class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?



	protected
  def after_sign_in_path_for(resource)
    root_path
  end


	private
#sign_up時の登録情報追加
    def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :first_name_kana,:family_name_kana, :post_code, :address, :telephone,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password]) # ログイン時はnameを使用
    end
end
