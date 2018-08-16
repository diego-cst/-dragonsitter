class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dragon, only: [:show, :edit, :update, :destroy]

  def index
    if params[:address].present?
      @dragons = Dragon.where('address ILIKE ?', "%#{params[:address]}%")
      @query = params[:address]
      set_markers
    else
      @dragons = Dragon.all
      set_markers
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
    params.require(:dragon).permit(:name, :color, :size, :diet, :temperament, :fire, :address, :price, :description, :photo_first, :photo_first_cache, :photo_second, :photo_second_cache, :photo_third, :photo_third_cache)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end

  def set_markers
    @markers = @dragons.map do |dragon|
      dragon.markers
    end
  end
end


