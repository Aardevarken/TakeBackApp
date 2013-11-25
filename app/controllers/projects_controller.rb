class ProjectsController < ApplicationController
  def new
  end

  def create
  end

  def show
    id = params[:id] # retrieve the project ID from URI route
    @project = Project.find(id)

  end

  def index
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
