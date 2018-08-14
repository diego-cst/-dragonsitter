class ProfileController < ApplicationController
  def show
    @user = current_user
    @owned_dragons = Dragon.where(owner: @user)
    @bookings =  @user.bookings
    @requests_sent = Booking.where(user: @user)
    @requests_received = Booking.joins(:dragon).where("dragons.user_id = ?", @user.id)
  end

end
