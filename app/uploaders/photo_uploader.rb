class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_public_id
   'user-silhouette.png'
  end
end
