class ApplicationController < ActionController::Base
  before_action :require_login #lock down this whole app
  helper_method :current_user #i can call current_user from a view
  helper_method :logged_in?
  
 def current_user
    @user = User.find_by(id: session[:user_id])
 end

 def logged_in?
  !!current_user
 end

  def require_login
    if session.include? :user_id
      else
        flash[:errors] = "Please log in first!"
        redirect_to root_path
      end
  end
  
end
