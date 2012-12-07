class SiteSetting < ActiveRecord::Base
	before_create :check_if_unique

	validates_presence_of :name, :intro_text, :footer_intro, :footer_contact, :contact_info, :password
  
  def check_if_unique
		SiteSetting.all.size < 1
	end
end