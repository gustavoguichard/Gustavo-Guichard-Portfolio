class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin

  def is_admin
  	@admin = session[:password] == "portugaL2013"
  end

  def protect_admin
    redirect_to root_path if !@admin
  end
end