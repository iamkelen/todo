class TasksController < ApplicationController

  def new
    @task = Task.new
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

  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    if @task.update(permitted_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path
  end

  private

    def permitted_params
      params.require(:task).permit(:title, :date, :status)
    end
end
