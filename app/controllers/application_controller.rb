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
end
