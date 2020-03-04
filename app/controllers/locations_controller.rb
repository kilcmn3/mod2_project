class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @photos = Photo.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)

    if @location.valid?
    redirect_to location_path(@location.id)
    else
      flash[:errors] = @location.errors.full_messages
      redirect_to new_location_path
    end
  end

  private
  def location_params
    params.require(:location).permit(:name, :latitude, :longtitude, :description)
  end
end
