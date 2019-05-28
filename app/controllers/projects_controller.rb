class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]#, unless: -> { @foo.nil? }
  #CRUD controller actions to go here

  def index
    @projects = Project.order(:name)
  end
  
  def show
  end



  private

  def set_project
    @project = Project.find(params["id"])
  end

  def project_params
    params.require(:project).permit(:name, :archive, :user_id, :inbox )
  end


end
