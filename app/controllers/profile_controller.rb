class ProfileController < ApplicationController
  def show
    @user = current_user
    @owned_dragons = Dragon.where(owner: @user)
    @bookings =  @user.bookings
  end

end
