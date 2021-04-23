module SessionHelper
	def logged_in?
		# !!current_user
		!current_user.nil?
	end

	def login_user(user)
		# token = SecureRandom.base64(16)
		# user.session_token = token
		# session[:session_token] = token
		session[:user_id] = user.id
		# user.save
	end

	def logout_user
		if current_user
			session.delete(:user_id)
			current_user = nil
		end

		if session[:session_token]
			session[:session_token] = nil
		end
	end


	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end
end
