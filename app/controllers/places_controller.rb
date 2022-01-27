class PlacesController < ApplicationController

  def show
    @places = Place.find(params[:id])
  end

  def index
    @places = Place.order('created_at DESC')
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Place added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def place_params
    params.require(:place).permit(:title, :address, :visited_by)
  end
end
