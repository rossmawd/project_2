class TasksController < ApplicationController
  #CRUD controller actions to go here
  before_action :set_task, only: [:show]

  def show
  end


  private

  def set_task
    @task = Task.find(params["id"])
  end

  def task_params
    params.require(:task).permit(:name, :archive, :project_id)
  end
end
