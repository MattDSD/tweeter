helpers do
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def avatar_url(email)
		gravatar_id = Digest::MD5.hexdigest(email)
		"http://gravatar.com/avatar/#{gravatar_id}"
	end  

	def logged_in?
		!current_user.nil?
	end
end
