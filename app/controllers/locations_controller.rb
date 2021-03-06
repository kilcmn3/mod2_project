class LocationsController < ApplicationController
  before_action :require_login
  def index
    @locations = Location.all
  end

  def show
    # byebug
    @location = Location.find(params[:id])
    @photos = @location.photos 
    @posts = @location.posts
    @posts_photos = @location.get_photos_and_posts

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
    params.require(:location).permit(:name, :latitude, :longitude, :description)
  end
end
#