class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.create(task_params.merge(project_id: params[:project_id]))
    if @task.valid?
      redirect_to projects_path(@project), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
      if @task.update(task_params)
        redirect_to projects_path(@task.project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @task.destroy
    redirect_to projects_path(@task.project)
  end

private

def task_params
  params.require(:task).permit(:title, :date, :status)
end

def find_task
  @task = Task.find(params[:id])
end

end
