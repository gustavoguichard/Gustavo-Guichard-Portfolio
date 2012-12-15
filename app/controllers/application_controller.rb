class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin

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
    redirect_to root_path if !@admin
  end
end