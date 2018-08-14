class RequestReceivedController < ApplicationController
  def index
    @user = current_user
    @requests_received = Booking.where(owner_id == @user.id)
  end


  # private

  # def set_requests_received

  # end
end
