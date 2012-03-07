class Service < ActiveRecord::Base
	has_attached_file :image, :styles => {:normal => "70x73"},
										:url => "/assets/images/services/:basename.:extension",
										:path => ":rails_root/public/assets/images/services/:basename.:extension"

	validates :title, :content, :presence => true
	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
