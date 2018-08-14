class RequestSentController < ApplicationController
  def index
    @user = current_user
    @requests_sent = Booking.where(user: @user)
  end
end
