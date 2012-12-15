class SessionsController < ApplicationController
	skip_before_filter :protect_admin

	def new
	end
	def create
		auth = request.env["omniauth.auth"]
		session[:nickname] = auth["info"]["nickname"]
		flash[:notice] = "Sucessfully logged in"
		redirect_to root_path
	end
	def destroy
		reset_session
		flash[:notice] = "Sucessfully logged out"
		redirect_to root_path
	end
end
