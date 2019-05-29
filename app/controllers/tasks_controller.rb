class TasksController < ApplicationController
  # CRUD controller actions to go here
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  

  def show
  end

  def new
    #byebug
    @task = Task.new
    @project_id = params[:project_id]
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
     
      @task.create_task_tags(params['tag']['id'])
      redirect_to task_path(@task)
    else
      #flash[:errors] = @task.errors.messages[:name]
      flash[:errors] = @task.errors.full_messages
      redirect_to new_task_path
    end
  end

  def edit
  end

  def update
   
    @task.update(task_params)
    if @task.valid?
      @task.update_task_tags(params['tag']['id'])
     
      @task.update(complete: params["task"]["complete"] )
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages
      flash[:notice] = "Hello, I am a task"
      redirect_to edit_task_path
    end
  end

  def destroy
    flash[:errors] = "'#{@task.name}' has been deleted from #{@task.project.name}"
    @task.destroy_task_tags
    @task.destroy
    
    redirect_to projects_path
  end
  
  private

  def set_task
    #byebug
    @task = Task.find(params["id"])
  end

  def task_params
    params.require(:task).permit(:name, :archive, :project_id)
    # The permit method returns a copy of the parameters object, returning only the permitted keys and values.
    # The require method ensures that a specific parameter is present, and if it's not provided, the require method throws an error.
  end
end
