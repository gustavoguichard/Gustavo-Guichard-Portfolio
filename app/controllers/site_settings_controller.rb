class SiteSettingsController < ApplicationController  
  def new
    @site_setting = SiteSetting.new
  end

  def edit
    @site_setting = @site_settings
  end

  def create
    @site_setting = SiteSetting.new(params[:site_setting])
    if @site_setting.save
      redirect_to root_path, notice: 'Site setting was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @site_setting = SiteSetting.find(params[:id])
    if @site_setting.update_attributes(params[:site_setting])
      redirect_to root_path, notice: 'Site setting was successfully updated.'
    else
      render action: "edit"
    end
  end

end