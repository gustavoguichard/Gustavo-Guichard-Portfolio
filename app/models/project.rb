class Project < ActiveRecord::Base
	extend FriendlyId

	friendly_id :title, :use => [:slugged, :history]

	has_many :taggings, :dependent => :destroy
	has_many :tags, :through => :taggings
	validates :title, :content, :image, :presence => true
	validates :video_url, format: { with: /(https?:\/\/)?(vimeo\.com\/)([0-9]+)(?!\w)\/?/, allow_blank: true }
	attr_writer :tag_names
	after_save :assign_tags, :destroy_empty_tags
	after_destroy :destroy_empty_tags

	mount_uploader :image, ProjectUploader
	mount_uploader :thumb, ProjectThumbUploader

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

	def thumbnail
		if thumb.to_s.match(/\d+/)[0].to_i == image.to_s.match(/\d+/)[0].to_i + 1
			image
		else
			thumb
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
