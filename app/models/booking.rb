class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  validates :start_date, :end_date, presence: true
  validates :status, inclusion: {in: (0..2)}
end
