class ProjectsController < ApplicationController
  before_filter :signed_in_user

  def show
    id = params[:id] # retrieve the project ID from URI route
    @project= user.projects.find(params[:id])
   end


  def new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:notice] = "#{@project.title} was successfully created!"
      redirect_to root_url
    else
      flash[:warning] = "Your project was NOT successfully created! Please try again.."
      render 'static_pages/home'
    end


  end



  def index
	@projects = Project.all
  end

  def update
  end

  def edit
	@project = Project.find params[:id]
  end

  def destroy
  end

 


private
  def project_params
    params.require(:project).permit(:title, :location, :description)
  end

end
