class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dragon, only: [:show, :edit, :update, :destroy]

  def index
    if params[:address].present?
      @dragons = Dragon.where('address ILIKE ?', "%#{params[:address]}%")
      @query = params[:address]
      set_markers
      set_info
    else
      @dragons = Dragon.all
      set_markers
      set_info
    end
  end

  def show
    if @dragon.booked_by?(current_user)
      @booking = current_user.bookings.where(dragon: @dragon).last
    else
      @booking = Booking.new
    end
    @markers = []
    @markers << @dragon.markers
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
    params.require(:dragon).permit(:name, :color, :size, :diet, :temperament, :fire, :address, :price, :description, :photo_first, :photo_first_cache, :photo_second, :photo_second_cache, :photo_third, :photo_third_cache)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end

  def set_markers
    @markers = @dragons.map do |dragon|
      {
        lat: dragon.latitude,
        lng: dragon.longitude,
        infoWindow: { content: render_to_string(partial: "/dragons/map_box", locals: { dragon: dragon }) },
        icon: 'http://res.cloudinary.com/dfn1yucto/image/upload/w_60,h_60,c_scale/co_rgb:f60909,dn_299,e_colorize:56/v1534429310/pin.gif'
      }
    end
  end

  def set_info
    @info = @dragons.map do |dragon|
      dragon.name
    end
  end

end


