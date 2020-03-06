# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :user_find, only:[:show,:edit,:update,:destroy, :delete_review]

  def show
    @user_photos = Photo.where(user_id: @user.id)
  end

  def new
    @user = User.new
    @errors = flash[:new_errors]
  end

  def create
    @user = User.create(user_params)
    if@user.valid?
      session[:user_id] = @user.id 
      redirect_to locations_path
    else
       flash[:new_errors] = @user.errors.full_messages
        redirect_to new_user_path
    end
  end

  def edit
    @errors = flash[:new_errors]
    render :edit
  end

  def update
    @user.update(user_params)

    if@user.valid?
      session[:user_id] = @user.id 
      redirect_to users_profile_path(@user.id)
     else
       flash[:new_errors] = @user.errors.full_messages
        redirect_to user_edit_path
    end
  end

  def delete_review
    user_photo = Photo.find_by(location_id: params[:location_id], user_id: session[:user_id]) 
    user_post = Post.find_by(location_id: params[:location_id], user_id: session[:user_id])
    user_location = UserLocation.find_by(user_id: session[:user_id])
    # if user_photo && user_post
    #   user_photo.destroy
    #   user_post.destroy
    # elsif user_photo 
    #   user_photo.destroy
    # elsif user_post
    #   user_post.destroy
    # end
    # # byebug  
    user_photo.destroy
    user_post.destroy
    user_location.destroy
    redirect_to users_profile_path
  end

  def destroy
    @user.destroy
    flash[:message] = "Sorry to hear that..hope we'll see you again!"
    redirect_to root_path
  end
  
  private

  def user_find
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :user_name, :password, :bio, :contact)
  end

  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

end
