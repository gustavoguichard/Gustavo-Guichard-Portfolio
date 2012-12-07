class Service < ActiveRecord::Base
	validates :title, :content, :presence => true
end
