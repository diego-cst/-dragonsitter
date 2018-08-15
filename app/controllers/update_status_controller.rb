class UpdateStatusController < ApplicationController

  def confirm_booking
    @booking = Booking.find(params[:booking_id])
    @booking.confirmed!
    if @booking.save!
      redirect_to profile_path(current_user)
    else
      raise
    end
  end

  def refuse_booking
    @booking = Booking.find(params[:booking_id])
    @booking.declined!
    if @booking.save!
      redirect_to profile_path(current_user)
    else
      raise
    end
  end

end
