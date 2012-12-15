class ProjectUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :postgresql_lo
  process :resize_to_fit => [600, 436]
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end