class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  has_many :owned_dragons, class_name: "Dragon"
  has_many :bookings
  has_many :rented_dragons, through: :bookings, source: :dragon
end
