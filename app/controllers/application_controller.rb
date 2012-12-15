class ApplicationController < ActionController::Base
  extend ActiveSupport::Memoizable

  protect_from_forgery
  before_filter :is_admin
  before_filter :protect_admin

  def is_admin
    @site_settings = saved_settings
    if @site_settings.nil? then
      @admin = true
      @site_settings = SiteSetting.new
    else
      @admin = session[:nickname] == ENV['TWITTER_USERNAME']
    end
  end

  def protect_admin
    unless @admin
      redirect_to root_path, notice: "You're not authorized to visit this page."
    end
  end

  def saved_settings
    SiteSetting.first
  end

  memoize :saved_settings
end