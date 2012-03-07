class Project < ActiveRecord::Base
	extend FriendlyId

	has_attached_file :image, :styles => {:thumbnail => "218x158#", :big => "600x436>"},
										:url => "/assets/images/portfolio/:style/:basename.:extension",
										:path => ":rails_root/public/assets/images/portfolio/:style/:basename.:extension"
	
	friendly_id :title, :use => [:slugged, :history]

	has_many :taggings, :dependent => :destroy
	has_many :tags, :through => :taggings
	validates :title, :content, :presence => true
	attr_writer :tag_names
	after_save :assign_tags, :destroy_empty_tags
	after_destroy :destroy_empty_tags

	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

	def tag_names
		@tag_names || tags.map(&:name).join(', ').titleize
	end

	def all_tags
		tags.map(&:name).join(' ')
	end

	def video_number
		video_url.match /\d+/ if video_url.present?
	end

	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

	private

	def assign_tags
		if @tag_names
			self.tags = @tag_names.split(',').map do |name|
				formatted_name = name.strip.split(' ').join('_').downcase
				Tag.find_or_create_by_name(formatted_name)
			end
		end
	end

	def destroy_empty_tags
		@tags = Tag.all
		@tags.each do |tag|
			tag.destroy if tag.projects.blank?
		end
	end

end
