class ApplicationController < ActionController::Base
  helper_method :current_user,:logged_in? #makes this available in the views as well (not just the controllers)
 
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    else
      nil 
    end
  end
  
  def logged_in?
    !!current_user
  end

  def authorized?   #Only shows people things if they're logged in!
    redirect_to login_path unless logged_in?
  end


  # ADD FURTHER METHODS
  #to allow people to see things based on ...time of day, or some other quality
end
