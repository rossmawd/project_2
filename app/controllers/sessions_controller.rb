class SessionsController < ApplicationController

  def new  #There is no model
  end

  def create
    
    # no strong params cause there is no mass assignment
    user = User.find_by(username: params[:username]) #We must identify the user to authenticate
    if user && user.authenticate(params[:password]) #authenticate must be second so we don't crash by calling it on a nil object!
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:errors] = ['Credentials do not match our records']
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  

  private

  # def user_params
  #   params.require(:user).permit(:name, :username, :password)
  # end

end
