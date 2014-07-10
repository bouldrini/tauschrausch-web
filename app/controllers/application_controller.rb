class ApplicationController < ActionController::Base
  layout 'unsigned_application'
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << User::ADDITIONAL_ATTRIBUTES
  end

  def after_sign_in_path_for(user)
    user_profile_path(user, user.full_name.parameterize)
  end
end
