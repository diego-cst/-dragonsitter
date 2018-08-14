class DragonPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_public_id
   'v1534235813/dinosaur'
  end
end

