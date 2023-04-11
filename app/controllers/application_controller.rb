# frozen_string_literal: true

class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'zeel', password: 'patel', only: :sidekiq
  before_action :authenticate_new_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
  end
end
