class PostsController < ApplicationController

    def new 
        @post = Post.new
    end 

    def create

        @post = Post.create(unlocked_params)

        

        redirect_to location_path(@post.location.id)

    end

    private 

    def unlocked_params
        params[:post][:user_id] = session[:user_id]
        params.require(:post).permit(:content, :rating, :user_id, :location_id)
    end 
end
