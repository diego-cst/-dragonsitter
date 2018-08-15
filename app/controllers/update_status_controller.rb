class UpdateStatusController < ApplicationController

  def confirm_booking
    @booking = Booking.find(params[:booking_id])
    @booking.status = 1
    if @booking.save!
      redirect_to profile_path(current_user)
    else
      raise
    end
  end

  def refuse_booking
    @booking = Booking.find(params[:booking_id])
    @booking.status = 2
    if @booking.save!
      redirect_to profile_path(current_user)
    else
      raise
    end
  end

end
