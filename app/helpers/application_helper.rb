module ApplicationHelper
	include SessionHelper

	def current_user
		# if session[:session_token]
		# 	@current_user = User.find_by_session_token(session[:session_token])
		# else
		# 	@current_user = User.new_guest
		# 	login_user(@current_user)
		# end
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		else
			@current_user = User.new_guest
			login_user(@current_user)
		end
	end

	def current_user?(user)
		user == current_user
	end

  	def require_login
    # if current_user && current_user.guest?
    # 	flash[:notice] = "Please login to view that page."
    #   redirect_to login_url
    # end
		unless logged_in?
			# byebug
			flash[:danger] = "Please Log in"
			redirect_to login_url
		end
  	end
end
