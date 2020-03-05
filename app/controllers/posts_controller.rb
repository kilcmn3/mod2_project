class PostsController < ApplicationController

    def new 
        @post = Post.new
    end 

    def create
        @post = Post.create(unlocked_params)
        UserLocation.create(user_id: session[:user_id], location_id: @photo.location_id)
        byebug
    end

    private 

    def unlocked_params
        params[:post][:user_id] = session[:user_id]
        params.require(:post).permit(:content, :user_id, :location_id)
    end 
end
