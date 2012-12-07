class Testimonial < ActiveRecord::Base
	validates :name, :company, :content, :presence => true
end