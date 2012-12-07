class Testimonial < ActiveRecord::Base
	validates :name, :company, :content, :avatar, :presence => true
  mount_uploader :avatar, TestimonialUploader
end