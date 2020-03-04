    class PhotosController < ApplicationController
    before_action :photo_find, only:[:edit, :udate, :destroy]
    def index 
        @photos = Photo.all
    end 

    def new 
        @photo = Photo.new
        @users = User.all
        @locations = Location.all
        @errors = flash[:new_errors]
    end 

    ##TODO join table for UserLocation should do if from Location controller.
    def create 
        @photo = Photo.create(unlocked_params)
        if@photo.valid?
            UserLocation.create(user_id: session[:user_id], location_id: @photo.location_id)
            redirect_to location_path(@photo.location_id)
          else
             flash[:new_errors] = ["Please fill out the blank space"]
              redirect_to new_photo_path
          end
    end

    def edit
        @locations = Location.all
    end

    def update
        @photo = Photo.create(unlocked_params)
        redirect_to locations_path
    end

    def destroy
        flash[:location_id] = @photo.location_id
        @photo.destroy
        redirect_to location_path(flash[:location_id])
    end

    private 
    def photo_find
        @photo = Photo.find_by(user_id: session[:user_id])
    end

    def unlocked_params
        params[:photo][:user_id] = session[:user_id]
        params.require(:photo).permit(:url, :title, :location_id, :image, :user_id)
    end 
end
