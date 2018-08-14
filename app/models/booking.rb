class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  validates :start_date, :end_date, presence: true
  validates :status, inclusion: {in: (0..2)}

  def total_price
    dragon_price = self.dragon.price
    duration = self.end_date - self.start_date
    price = dragon_price * duration
  end

  def status_color
    case self.status
    when 0
      return "yellow"
    when 1
      return "green"
    when 2
      return "red"
    end
  end
end
