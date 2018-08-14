class DragonPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_public_id
   'dinosaur.png'
 end
end

