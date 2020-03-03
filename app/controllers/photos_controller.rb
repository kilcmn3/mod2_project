class PhotosController < ApplicationController

    def index 
        @photos = Photo.all
    end 
    
    def new 
        @photo = Photo.new

        @locations = Location.all

    end 

    def create
        
        @photo = Photo.create(unlocked_params)
        redirect_to locations_path

    end


    private 

    def unlocked_params
        params.require(:photo).permit(:url, :title, :location_id, :image)
    end 
end
