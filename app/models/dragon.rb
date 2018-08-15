class Dragon < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings, dependent: :destroy
  has_many :renters, through: :bookings, source: :user

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :temperament, inclusion: {in: (0..4)}
  validates :size, inclusion: {in: (0..4)}

  mount_uploader :photo, DragonPhotoUploader

  def describe_temperament
    case self.temperament
    when 0
      return "Cuddly"
    when 1
      return "Well-mannered"
    when 2
      return "Docile"
    when 3
      return "Insatible"
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
    renters.where(id: user.id).present?
  end

end
