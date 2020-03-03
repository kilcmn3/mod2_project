# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :log_in, only: [:show , :edit,  :update, :destroy]
  def index
    @errors = flash[:errors]
  end

  def show
    render :show
  end

  def new
    @user = User.new
    @errors = flash[:errors]
  end

  def create
    @user = User.create(user_params)
    if@user.valid?
      session[:user_id] = @user.id 
      redirect_to user_path(@user.id)
    else
       flash[:errors] = @user.errors.full_messages
       redirect_to new_user_path
    end
  end

  def edit
    render :edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_name, :password, :bio, :contact)
  end


  def log_in
    @user = User.find(session[:user_id])
  end

end
