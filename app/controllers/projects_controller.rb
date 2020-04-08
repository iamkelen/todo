class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
    @tasks = Task.all.order(:position)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    @project.user_id = current_user.id
      if @project.valid?
        @project.save
        redirect_to projects_path, notice: 'Project was successfully created.'
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

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

  def find_project
    @project = Project.find(params[:id])
  end

end
