# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_find, only:[:show,:edit,:update,:destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]

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
      redirect_to user_path(@user.id)
    else
       flash[:new_errors] = @user.errors.full_messages
      #  byebug
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
