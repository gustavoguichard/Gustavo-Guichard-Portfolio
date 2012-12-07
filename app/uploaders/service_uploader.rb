# encoding: utf-8

class ServiceUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :postgresql_lo
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [70, 73]
  
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
