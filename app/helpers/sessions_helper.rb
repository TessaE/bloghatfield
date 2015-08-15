module SessionsHelper
	def log_in()
    	session[:user_id] = "admin"
  	end

  	def current_user
    	@current_user ||= session[:user_id]
  	end

  	def logged_in?
    	!current_user.nil?
  	end

  	def log_out
    	session.delete(:user_id)
    	@current_user = nil
  	end
end
