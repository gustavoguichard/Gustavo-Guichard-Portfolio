class ProjectThumbUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :postgresql_lo
  process :resize_to_fill => [220, 160]
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
