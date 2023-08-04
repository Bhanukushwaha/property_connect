class ApplicationController < ActionController::Base
	# protect_from_forgery with: :exception
  before_action :check_profile
  before_action :user_admin, expect:[:after_sign_in_path_for]
  include ApplicationHelper
  layout :set_layout
  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_root_path : root_path
  end
  def user_admin
    if request.fullpath.split("/")[1] == "admin"
      if current_user.role != 'admin'
        redirect_to root_path
      else
        request.url
      end
    end
  end
  def check_profile
    if current_user.present? && current_user.role != "admin"
      if !current_user.profile.present? && !current_user&.profile&.is_complete
        redirect_to(new_profile_path)
      end
    end
  end
  
  def authentication_admin!
    unless current_user.is_admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :email,:password_confirmation,:password])
  end
end
