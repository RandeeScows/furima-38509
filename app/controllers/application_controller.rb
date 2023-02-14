class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      # admin, 2222　　e10f8b5487e8b7af56301b251d9ca238　a927e8964ea777dc6eca0e3ffed00aef
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :family_name, :given_name, :phonetic_fn, :phonetic_gn, :birthday])
  end
end
