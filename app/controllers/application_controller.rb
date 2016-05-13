class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # does this callback introduce some cross-linking?
  before_action :configure_permitted_params, if: :devise_controller?

  # why can't this be handled in the relevant individual controllers?
  # I tried using the commented out actions and 'before_actions' in the
  # RegistrationsController with no luck...
  def configure_permitted_params

    added_attributes = [:username,
                        :email,
                        :password,
                        :password_confirmation,
                        :remember_me]

    devise_parameter_sanitizer.permit(:sign_up, keys: added_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attributes)
  end

  def after_sign_in_path_for(resource)
    user_reg_apps_path(current_user)
  end
end
