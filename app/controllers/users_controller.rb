class UsersController < ApplicationController


  #COPIED from another class TO CHECK

  before_action :set_user, only: %i[show edit update destroy confirm] # , unless: -> { @foo.nil? }
  # CRUD controller actions to go here

  def index
    @users = User.order(:name)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    #user.user = User.all.sample # current_user

    if user.valid?
      redirect_to user_path(user)
    else
      redirect_to new_user_path
      flash[:errors] = user.errors.full_messages
    end
  end

  private

  def set_user
    @user = user.find(params['id'])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
