class ProjectsController < ApplicationController
  #before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def show
    #if signed_in?
    @project = current_user.projects.find(params[:id])
    #else
    #end
    #@projects = @user.projects.paginate(page: params[:page])
   end


  def new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to work_url
    else
      flash[:warning] = "it didn't work. try again."
      render 'static_pages/home'
    end
  end

  def search
    @project = Project.where("location LIKE ?", "#{params[:search]}%")
    render :action => :index
  end

  def index
	  #@user = User.find(params[:id])

    if signed_in?
      @projects = current_user.projects.paginate(page: params[:page])
    end
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = " #{@project.title} was successfully updated!"
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
    flash[:success] = "#{@project.title} was removed!"
    redirect_to work_url
  end

 


private
  def project_params
    params.require(:project).permit(:title, :location, :description)
  end
  def correct_user
      @project = current_user.projects.find(params[:id])
      redirect_to root_url if @project.nil?
    end

end
