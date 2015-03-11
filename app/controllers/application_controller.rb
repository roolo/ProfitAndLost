class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ba_credentials

  private

  def set_ba_credentials
    if current_user && current_user.has_billapp_credentials?
      Remote::Billapp::Base::set_ba_credentials current_user
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :billapp_subdomain
    devise_parameter_sanitizer.for(:account_update) << :billapp_username
    devise_parameter_sanitizer.for(:account_update) << :billapp_userpass
  end
end
