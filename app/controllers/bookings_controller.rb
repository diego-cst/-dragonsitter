class BookingsController < ApplicationController
  before_action :set_dragon, only: [:new, :create]
  before_action :set_user, only: [:create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.dragon = @dragon
    if @booking.save
      redirect_to(booking_path(@booking))
    else
      render(:new)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_dragon
    @dragon = Dragon.find(params[:dragon_id])
  end

  def set_user
    @user = current_user
  end

end