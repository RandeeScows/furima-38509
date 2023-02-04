class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      # admin, 2222　　e10f8b5487e8b7af56301b251d9ca238　a927e8964ea777dc6eca0e3ffed00aef
    end
  end  
end
