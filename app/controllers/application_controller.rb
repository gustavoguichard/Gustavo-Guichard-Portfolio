class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin

  def is_admin
  	@site_settings = SiteSetting.first || nil
  	if @site_settings.nil? then @admin
	  else @admin = session[:nickname] == "gustavoguichard"
	  end
  end

  def protect_admin
    redirect_to root_path if !@admin
  end
end