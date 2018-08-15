class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dragon, only: [:show, :edit, :update, :destroy]

  def index


    # if params[:query].present?
      @dragons = Dragon.where.not(latitude: nil, longitude: nil)
      @markers = @dragons.map do |flat|
        {
          lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      # end
      # @query = params[:query]
    # else
    #   @dragons = Dragon.all
    end
  end

def show
  if @dragon.booked_by?(current_user)
    @booking = current_user.bookings.where(dragon: @dragon).last
  else
    @booking = Booking.new
  end
end

def new
  @dragon = Dragon.new
end

def create
  @dragon = Dragon.new(dragon_params)
  @dragon.owner = current_user
  if @dragon.save
    redirect_to dragons_path
  else
    render :new
  end
end

def edit

end

def update
  @dragon.owner = current_user
  if @dragon.update(dragon_params)
    redirect_to profile_path(@dragon.owner)
  else
    render :new
  end
end

def destroy
  @dragon.owner = current_user
  if @dragon.destroy
    redirect_to profile_path(@dragon.owner)
  else
    render :new
  end
end

private

def dragon_params
  params.require(:dragon).permit(:name, :color, :size, :diet, :temperament, :fire, :location, :price, :description, :photo, :photo_cache)
end

def set_dragon
  @dragon = Dragon.find(params[:id])
end
end


