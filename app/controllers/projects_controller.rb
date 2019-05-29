class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]#, unless: -> { @foo.nil? }
  #CRUD controller actions to go here

  def index
    @projects = Project.order(:name)
  end
  
  def show
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)
    project.user = User.all.sample # current_user

    if project.save
      redirect_to project_path(project)
    else
      redirect_to new_project_path
      flash[:errors] = project.errors.full_messages
    end

  end


  private

  def set_project
    @project = Project.find(params["id"])
  end

  def project_params
    params.require(:project).permit(:name, :description )
  end


end
