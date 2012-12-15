class SessionsController < ApplicationController
	skip_before_filter :protect_admin

	def new
	end
	
	def create
		auth = request.env["omniauth.auth"]
		session[:nickname] = auth["info"]["nickname"]
		redirect_to root_path, notice: "Sucessfully logged in"
	end

	def destroy
		reset_session
		redirect_to root_path, notice: "Sucessfully logged out"
	end
end
