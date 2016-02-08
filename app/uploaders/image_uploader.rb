# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process :auto_orient
  process resize_to_fit: [880, 400]

  version :primary_news_size do
    process resize_to_fit: [450, -1]
  end

  version :small_size do
    process resize_to_fit: [350, -1]
  end

  version :thumb do
    process resize_to_fit: [60, 60]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.expedition_id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end
end
