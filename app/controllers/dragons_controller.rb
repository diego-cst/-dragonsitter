class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @dragons = Dragon.all
  end

  def show
    @dragon = Dragon.find(params[:id])
  end

  def new
    @dragon = Dragon.new(dragon_params)
  end

  private

  def dragon_params
    params.require(:dragon).permit(:name, :color, :size, :diet, :temperament, :fire, :location, :price, :description, :photo)
  end
end


