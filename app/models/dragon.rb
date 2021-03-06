class Dragon < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings, source: :user

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :temperament, inclusion: {in: (0..4)}
  validates :size, inclusion: {in: (0..4)}

  mount_uploader :photo_first, DragonPhotoUploader
  mount_uploader :photo_second, DragonPhotoUploader
  mount_uploader :photo_third, DragonPhotoUploader

  def markers
    { lat: self.latitude,
      lng: self.longitude,
      icon: 'http://res.cloudinary.com/dfn1yucto/image/upload/w_60,h_60,c_scale/co_rgb:f60909,dn_299,e_colorize:56/v1534429310/pin.gif'
    }
  end

  def describe_temperament
    case self.temperament
    when 0
      return "Cuddly"
    when 1
      return "Well-mannered"
    when 2
      return "Docile"
    when 3
      return "Insatiable"
    when 4
      return "Ferocious"
    end
  end

  def describe_size
    case self.size
    when 0
      return "Tiny"
    when 1
      return "Small"
    when 2
      return "Mid-sized"
    when 3
      return "Big"
    when 4
      return "Giant"
    end
  end

  def booked_by?(user)
    renters.where(id: user.id).present? if !user.nil?
  end

end
