class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_public_id
   'v1534235817/user-silhouette'
  end
end
