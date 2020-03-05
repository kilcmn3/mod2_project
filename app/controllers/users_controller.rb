# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :user_find, only:[:show,:edit,:update,:destroy]

  def show
    render :show
  end

  def new
    @user = User.new
    @errors = flash[:new_errors]

    render layout: "login"
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
