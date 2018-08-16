class BookingsController < ApplicationController
  before_action :set_dragon, only: [:new, :create, :show]
  before_action :set_user, only: [:create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dragon = @dragon
    unless @dragon.owner == current_user
      @booking.user = @user
      @booking.status = "pending"
      if @booking.save
        redirect_to(dragon_booking_path(@dragon, @booking))
      else
        render "dragons/show"
      end
    else
      render "dragons/show", notice: "it's yours!"
    end
  end

 def show
    @booking = Booking.find(params[:id])
  end
  # def show
  #   # @user = current_user
  #   # @booking = Booking.where(user_id: @user_id)
  #   # @dragon = Booking.joins(:dragon).where(@booking.dragon_id = @dragon.id)
  #   # @booked_dragon = Booking.where(user_id: @user_id)
  # end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to profile_path(current_user)
    else
      render :new
    end
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
