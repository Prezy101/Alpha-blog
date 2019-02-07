class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find (session[:user_id]) if session[:user_id]

  end



  def logged_in?

    !! current_user # converted to boolean

  end

def require_user
  if !logged_in?
    flash[:danger] = "You must be logged in to perform that action"
    redirect_to root_path
  end

end

  #this is the fucntion that you created to check if a user in admin user and worked... good job Litchfield
  def admin_user
    if  !current_user.admin
      flash[:danger] = 'Please note that only administrators can create categories'
    end

  end

end
