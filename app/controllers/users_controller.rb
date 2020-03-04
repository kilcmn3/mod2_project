# frozen_string_literal: true
##TODO need to work on user's show page
# 1. user will able to see all his/her locations details such as photo, post, name? 
# 2. get the right redirect_to (from user page to where?)
class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :user_find, only:[:show,:edit,:update,:destroy]

  def index
    render :index
  end

  def show
    render :show
  end

  def new
    @user = User.new
    @errors = flash[:new_errors]
  end

  def create
    @user = User.create(user_params)
    if@user.valid?
      session[:user_id] = @user.id 
      redirect_to users_profile_path(@user.id)
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

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
