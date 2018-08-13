class Dragon < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :renters, through: :bookings, source: :user

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :temperament, inclusion: {in: (0..5)}
end
