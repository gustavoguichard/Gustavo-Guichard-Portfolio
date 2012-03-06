class SessionsController < ApplicationController
	def new
	end
	def create
		session[:password] = params[:password]
		flash[:notice] = "Sucessfully logged in"
		redirect_to root_path
	end
	def destroy
		reset_session
		flash[:notice] = "Sucessfully logged out"
		redirect_to root_path
	end
end
