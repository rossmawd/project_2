class UsersController < ApplicationController


  before_action :set_user, only: %i[show edit update destroy confirm]
  # CRUD controller actions to go here
  before_action :authorized?
  skip_before_action :authorized?, only: [:new, :create]

  def index
    @users = User.order(:name)
  end

  def show
    authorized?
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    #user.user = User.all.sample # current_user

    if user.valid?
      Project.create(name: "Inbox", user_id: user.id,
         inbox: true,
         description: "Your Inbox is where you can put tasks that don't (yet) have a Project" )
         session[:user_id] = user.id
      redirect_to projects_path#user_path(user)  
      flash[:errors] = "Welcome #{user.name}! use the links above to get started..."
    else
      redirect_to new_user_path
      flash[:errors] = user.errors.full_messages
    end
  end

  private

  def set_user
   # byebug
    @user = User.find(params['id'])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
