class BookingsController < ApplicationController
  before_action :set_dragon, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date)
  end

  def set_dragon
    @dragon = Dragon.find(params[dragon_id])
  end

end
