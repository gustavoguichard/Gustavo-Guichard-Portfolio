class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin

  def is_admin
  	if !@site_settings = SiteSetting.first then redirect_to new_site_settings_path end
  	if @site_settings.nil? then @admin
	  else @admin = session[:nickname] == "gustavoguichard"
	  end
  end

  def protect_admin
    redirect_to root_path if !@admin
  end
end