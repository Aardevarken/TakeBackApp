class ProjectsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def show
    @project = current_user.projects.find(params[:id])
    #@projects = @user.projects.paginate(page: params[:page])
   end


  def new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:notice] = "#{@project.title} was successfully created!"
      redirect_to work_url
    else
      flash[:warning] = "Your project was NOT successfully created! Please try again.."
      render 'static_pages/home'
    end


  end



  def index
	  #@user = User.find(params[:id])
    @projects = current_user.projects.paginate(page: params[:page])
  end

  def update
        @project = current_user.projects.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = " #{@project.title} was successfully updated !"
      redirect_to project_path(@project)
    else
      render 'edit'
    end

  end

  def edit
	@project = current_user.projects.find(params[:id])
  end

  def destroy
    @project.destroy
    redirect_to root_url
  end

 


private
  def project_params
    params.require(:project).permit(:title, :location, :description)
  end
  def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to root_url if @projects.nil?
    end

end
