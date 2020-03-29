class TasksController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.create(permitted_params.merge(project_id: params[:project_id]))
    if @task.valid?
      redirect_to project_path(@project), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

private

def permitted_params
  params.require(:task).permit(:title, :date, :status)
end

end
