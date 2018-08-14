class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    if params[:query].present?
      @dragons = Dragon.where('location ILIKE ?', "#{params[:query]}")
      @query = params[:query]
    else
      @dragons = Dragon.all
    end
  end

  def show
    @dragon = Dragon.find(params[:id])
  end

  def new
    @dragon = Dragon.new
  end

  # To be used for create:

  # private

  # def dragon_params
  #   params.require(:dragon).permit(:name, :color, :size, :diet, :temperament, :fire, :location, :price, :description, :photo)
  # end
end


