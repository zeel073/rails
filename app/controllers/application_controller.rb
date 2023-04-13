# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_new_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    current_new_user
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to users_path, :alert => exception.message
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :role, :current_password) }
  end
  def user_not_authorized(exception)
        policy_name = exception.policy.class.to_s.underscore
        err_message = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
        render json: { message: err_message }, status: :unauthorized
  end
end
