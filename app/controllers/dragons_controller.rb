class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

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

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.owner = current_user
    if @dragon.save
      redirect_to dragons_path
    else
      render :new
    end
  end

  private

  def dragon_params
    params.require(:dragon).permit(:name, :color, :size, :diet, :temperament, :fire, :location, :price, :description, :photo, :photo_cache)
  end
end


