class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @dragons = Dragon.where('location ILIKE ?', "#{params[:query]}")
    else
      @dragons = Dragon.all
    end
  end

  def show
    @dragon = Dragon.find(params[:id])
  end

end
