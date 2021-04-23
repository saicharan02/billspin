class ApplicationController < ActionController::Base
    protect_from_forgery
  #   # include SessionHelper
  #   # before_action :current_user
  #   before_action :require_login

  #   def current_user
  #       @current_user = User.find_by_session_token(cookies[:my_token])
  #   end

    
  # def require_login
  #   if !current_user || current_user&.guest?
  #     flash[:notice] = "Please login to view that page."
  #     redirect_to login_url
  #   end
  # end
end
