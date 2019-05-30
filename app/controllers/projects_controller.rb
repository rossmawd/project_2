class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :confirm]#, unless: -> { @foo.nil? }
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

    def edit   #NEEDED?
    end

    def update
     
      @project.update(project_params)
      #if project complete set all tasks to complete
      if @project.valid?
        redirect_to projects_path
      else
    
        flash[:errors] = @project.errors.full_messages 
        redirect_to new_project_path
      end
    end

    def destroy
      flash[:errors] = "#{@project.name} has been deleted AND it's tasks are gone too!"
      tasks = Task.all.select{|t| t.project_id == @project.id}
     
      if tasks.class == Array
        tasks.each{|task| task.destroy}
      end
      @project.destroy
      
      redirect_to projects_path
    end

    def confirm
       
    end

  private

  def set_project
    @project = Project.find(params["id"])
  end

  def project_params
    params.require(:project).permit(:name, :description, :complete)
  end


end
