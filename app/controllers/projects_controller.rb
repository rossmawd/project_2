# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy confirm] # , unless: -> { @foo.nil? }
  # CRUD controller actions to go here

  def index
    if params["sort"]# == "outstanding" #this doesn't break when params["sort"] == nil     
      @projects = Project.sorted(params["sort"])
    else 
      @projects = Project.order(:name)
    end
  end

  def user_sort
    @projects = Project.all.sort_by{|project| project.user.name}
    render :index # renders the index page WITHOUT running the index controller action
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)
    
    project.update( name: project.name.downcase)
    
    #project.user = User.all.sample # current_user to be implemented

    if project.save
      redirect_to project_path(project)
    else
      redirect_to new_project_path
      flash[:errors] = project.errors.full_messages
    end
  end

  def edit; end

  def update
    @project.update(project_params)
    # if project complete set all tasks to complete
    if @project.valid?
      redirect_to projects_path
    else

      flash[:errors] = @project.errors.full_messages
      redirect_to new_project_path
    end
  end

  def destroy
    flash[:errors] = "#{@project.name} has been deleted AND it's tasks are gone too!"
    tasks = Task.all.select { |t| t.project_id == @project.id }

    tasks.each(&:destroy) if tasks.class == Array
    @project.destroy

    redirect_to projects_path
  end

  def confirm
    if @project.inbox == true
      flash[:errors] = "You can't delete your Inbox!"
      redirect_to project_path(@project)
    end
  end

  private

  def set_project
    @project = Project.find(params['id'])
  end

  def project_params
    params.require(:project).permit(:user_id, :name, :description, :complete)
  end
end
