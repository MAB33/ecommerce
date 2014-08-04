module UsersHelper

	def current_user
		session[:user_id].nil? ? nil :User.find(session[:user_id])
	end

	def auth_user
		@user.id == current_user.id
	end
end
