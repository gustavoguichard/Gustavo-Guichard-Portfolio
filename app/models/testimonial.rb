class Testimonial < ActiveRecord::Base
	validates :name, :company, :content, :avatar, :presence => true
  mount_uploader :avatar, TestimonialUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end