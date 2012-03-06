class SiteSetting < ActiveRecord::Base
	before_create :check_if_unique

	validates_presence_of :name, :intro_text, :footer_intro, :footer_contact, :contact_info
  
  private_class_method :new, :destroy, :destroy_all, :delete, :delete_all
  
  @@s = find(:first)

  def self.method_missing(method, *args)
    option = method.to_s
    if option.include? '='
        # Set the value
        var_name = option.gsub('=', '')
        value = args.first
        @@s[var_name] = value
      else
        # Get the value
        @@s[option]
    end
  end

  def sel.new
  	@@s
  end
  
  def self.save
    @@s.save
  end

  def self.update_attributes(attributes)
    @@s.update_attributes(attributes)
  end

  def self.errors
    @@s.errors
  end

	def check_if_unique
		SiteSetting.all.size < 1
	end
end
