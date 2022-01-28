class PlacesController < ApplicationController

  def show
    @places = Place.find(params[:id])
  end

  def index
    if Rails.env.production?
      @country = request.location.country
      @city = request.location.city
      country_code = request.location.country_code
      @currency = country_code.upcase == "AU" ? "AUD" : "USD"
    end
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
