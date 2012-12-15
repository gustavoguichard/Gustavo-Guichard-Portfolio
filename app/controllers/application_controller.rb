class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin
  before_filter :protect_admin

  def is_admin
    @site_settings = session[:site_settings] || SiteSetting.first
    if @site_settings.nil? then
      @admin = true
      @site_settings = SiteSetting.new
    else
      session[:site_settings] ||= @site_settings
      @admin = session[:nickname] == ENV['TWITTER_USERNAME']
    end
  end

  def protect_admin
    unless @admin
      flash[:notice] = "You're not authorized to visit this page."
      redirect_to root_path
    end
  end
end