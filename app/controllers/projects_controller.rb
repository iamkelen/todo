class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(permitted_params)
      if @project.valid?
        redirect_to project_path(@project), notice: 'Project was successfully created.'
      else
        render :new
      end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
      if @project.update(permitted_params)
        redirect_to project_path(@project), notice: 'Project was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def permitted_params
    params.require(:project).permit(:title, :tasks)
  end

end
