# frozen_string_literal: true

class SessionsController < ApplicationController

  def authentication
    user = User.find_by(user_name: params[:user_name])
    
    if params[:user_name] == '' || params[:password] == ''
      flash[:errors] = "user name or password can't be blank!"
      redirect_to root_path
    elsif !user || !user.authenticate(params[:password])
      flash[:errors] = "User name or password is incorrect!"
      redirect_to root_path
    elsif user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_profile_path
    end
  end

  def log_out
    reset_session
    flash[:message] = "Good bye!"
    redirect_to root_url
  end
end
