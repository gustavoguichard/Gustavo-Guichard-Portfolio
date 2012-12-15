class Service < ActiveRecord::Base
  mount_uploader :image, ServiceUploader

  validates :title, :content, :image, :presence => true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end