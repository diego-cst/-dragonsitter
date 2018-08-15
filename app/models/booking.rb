class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  validates :start_date, :end_date, presence: true
  enum status: [ :pending, :confirmed, :declined ]

  def total_duration
    duration = self.end_date - self.start_date
    duration.to_i
  end

  def total_price
    dragon_price = self.dragon.price
    duration = self.total_duration
    price = dragon_price * duration
  end

  def status_color
    case self.status
    when "pending"
      return "yellow"
    when "confirmed"
      return "green"
    when "declined"
      return "red"
    end
  end
end
