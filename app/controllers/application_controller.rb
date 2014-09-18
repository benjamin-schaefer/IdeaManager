class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #load_and_authorize_resource unless :devise_controller?
  
  #before_action :authenticate_user!
  #before_filter <=> before_action?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :ensure_access

  protected

  # add own parameters to devise controller:
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [ :name, :picture ]
    devise_parameter_sanitizer.for(:account_update) << [ :name, :picture ]
  end

end
