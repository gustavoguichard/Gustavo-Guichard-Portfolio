class ApplicationController < ActionController::Base
  extend ActiveSupport::Memoizable

  protect_from_forgery
  before_filter :is_admin
  before_filter :protect_admin

  def is_admin
    @admin = session[:nickname] == ::Configuration[:twitter_username]
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