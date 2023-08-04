class PictureTwoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'sample.png'
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
