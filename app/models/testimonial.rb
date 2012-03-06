class Testimonial < ActiveRecord::Base
	has_attached_file :avatar, styles: {thumbnail: "120x120#"},
										url: "/assets/images/testimonials/:basename.:extension",
										path: ":rails_root/public/assets/images/testimonials/:basename.:extension"

	validates :name, :company, :content, presence: true
	validates_attachment_presence :avatar
	validates_attachment_size :avatar, less_than: 5.megabytes
	validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/png', 'image/gif']
end