class ProjectsController < ApplicationController
  before_action :find_project_with_tasks, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :tasks)
  end

  def find_project_with_tasks
    @project = current_user.projects.find(params[:id])
    @tasks = @project.tasks
  end

end
