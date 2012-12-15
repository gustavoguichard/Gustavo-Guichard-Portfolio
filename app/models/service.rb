class Service < ActiveRecord::Base
	validates :title, :content, :image, :presence => true
  mount_uploader :image, ServiceUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
