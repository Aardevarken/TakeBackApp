class ProjectsController < ApplicationController
  def new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    flash[:notice] = "#{@project.title} was successfully created!"
    redirect_to @project

  end

  def show
    id = params[:id] # retrieve the project ID from URI route
    @project = Project.find(params[:id])
   end

  def index
	@projects = Project.all
  end

  def update
  end

  def edit
  end

  def destroy
  end

private
  def project_params
    params.require(:project).permit(:title, :location, :description)
  end

end
