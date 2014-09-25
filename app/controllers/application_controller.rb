class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #load_and_authorize_resource unless :devise_controller?
  
  #before_action :authenticate_user!
  #before_filter <=> before_action?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :ensure_access

  before_action :set_locale

  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
      # || extract_locale_from_tld 
  end

  # Get locale from top-level domain or return nil if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.pl
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    if Rails.env.development?
      parsed_locale = params[:host].to_s.split('.').last
    else
      parsed_locale = request.host.split('.').last
    end
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 gr.application.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    parsed_locale = first_subdomain
    #request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def first_subdomain
    request.domain.split('.').first
  end
  helper_method :first_subdomain

  protected

  # add own parameters to devise controller:
  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << [ :name, :picture ]
    # devise_parameter_sanitizer.for(:account_update) << [ :name, :picture ]

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :picture, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) } #:name, :email,
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :picture, :email, :password, :password_confirmation, :current_password) }
  end

end
