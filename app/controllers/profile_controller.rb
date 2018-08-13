class ProfileController < ApplicationController
  def show
    if current_user
      @user = current_user
    end
  end
end
