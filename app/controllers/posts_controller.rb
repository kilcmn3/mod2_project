class PostsController < ApplicationController

    def new 
        @post = Post.new
    end 

    def create
        @post = Post.create(unlocked_params)
    end

    private 

    def unlocked_params
        params.require(:post).permit(:content)
    end 
end
